-- SafeStatus Supabase Database Schema
-- Project: hglxtclgwhkxzqgrxdvv

-- Profiles table (stores user information)
CREATE TABLE profiles (
  id UUID REFERENCES auth.users(id) PRIMARY KEY,
  full_name TEXT,
  email TEXT,
  city TEXT DEFAULT 'תל אביב',
  language TEXT DEFAULT 'עברית',
  status TEXT DEFAULT 'unknown', -- 'safe', 'shelter', 'unknown'
  status_updated_at TIMESTAMPTZ,
  avatar_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Active alerts table (stores current alerts from OREF/Socket.IO)
CREATE TABLE active_alerts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  category TEXT NOT NULL,         -- 'missiles', 'earthquakes', etc.
  cities TEXT[] NOT NULL,         -- Array of city names
  description TEXT,
  severity TEXT DEFAULT 'info',   -- 'critical', 'warning', 'info'
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ
);

-- User contacts table (synced phone contacts for mutual matching)
CREATE TABLE user_contacts (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES profiles(id),
  contact_phone TEXT NOT NULL,    -- Normalized phone number
  contact_name TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, contact_phone)
);

-- RPC: Get mutual contacts with their safety status
CREATE OR REPLACE FUNCTION get_mutual_contacts(requesting_user_id UUID)
RETURNS TABLE (
  contact_id UUID,
  name TEXT,
  status TEXT,
  status_updated_at TIMESTAMPTZ,
  city TEXT
) AS $$
BEGIN
  RETURN QUERY
  SELECT
    p.id AS contact_id,
    p.full_name AS name,
    p.status,
    p.status_updated_at,
    p.city
  FROM user_contacts uc1
  JOIN user_contacts uc2 ON uc1.contact_phone = uc2.contact_phone
  JOIN profiles p ON p.id = uc2.user_id
  WHERE uc1.user_id = requesting_user_id
    AND uc2.user_id != requesting_user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE active_alerts ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_contacts ENABLE ROW LEVEL SECURITY;

-- Policies
CREATE POLICY "Users can view own profile" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Anyone can read active alerts" ON active_alerts FOR SELECT TO authenticated USING (true);
CREATE POLICY "Users can manage own contacts" ON user_contacts FOR ALL USING (auth.uid() = user_id);
