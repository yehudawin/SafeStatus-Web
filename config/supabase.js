/**
 * Supabase Configuration for SafeStatus
 *
 * Database tables:
 *   - profiles: user profile data (name, email, city, status)
 *   - active_alerts: currently active alerts
 *   - user_contacts: synced phone contacts for mutual matching
 *
 * RPC functions:
 *   - get_mutual_contacts(requesting_user_id): returns mutual contacts with status
 */

export const SUPABASE_URL = 'https://hglxtclgwhkxzqgrxdvv.supabase.co';
export const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhnbHh0Y2xnd2hreHpxZ3J4ZHZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE2MDM1MjAsImV4cCI6MjA4NzE3OTUyMH0.bzh_XUMEJ2RYckDpPJJRAjSk6xw3sVg0i1uouOolV3g';
