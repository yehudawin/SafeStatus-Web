# SafeStatus (סייף סטטוס) — Web App

Israeli emergency alert & safety status web application built with [Base44](https://base44.com).

## Live App

**🔗 [daffy-safe-status-now.base44.app](https://daffy-safe-status-now.base44.app)**

## Overview

SafeStatus lets Israeli citizens:
- Receive real-time rocket/missile alerts (Pikud HaOref)
- Share their safety status with family & friends
- View a live alert map of Israel
- Get push notifications for red alerts

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Base44 (React, auto-generated) |
| Auth & DB | Supabase (PostgreSQL + Auth) |
| Real-time alerts | Socket.IO → redalert.orielhaim.com |
| Fallback alerts | OREF API HTTP polling |
| Map | Leaflet + CartoDB Dark tiles |
| Hosting | Base44 (Wix) |

## Pages

### 1. Home (בית)
- Greeting with user name from Supabase profile
- Real-time alert banner (Socket.IO)
- Status buttons: "אני בסדר" / "במרחב מוגן"
- Mutual contacts list

### 2. Map (מפת מצבים)
- Dark CartoDB tiles centered on Israel
- Red circle markers for alert cities (28 Israeli cities mapped)
- Filter pills: "הכל" / "באזור שלי"
- Legend: safe (green) / alert (red)
- Alert card overlay with live data

### 3. Notifications (התראות)
- Real-time alert feed from Socket.IO + Supabase
- Severity tags: קריטי (missiles), אזהרה (earthquakes), מידע (other)
- Timestamps in Hebrew relative format

### 4. Settings (הגדרות)
- Profile card (name, email, avatar)
- City, language, contacts count
- Notification toggles (red alerts, status updates, alert sound)
- Share & logout

## Design System

| Token | Value |
|-------|-------|
| Background | #0C0C0C |
| Card | #1A1A1A |
| Border | #2A2A2A |
| Safe (green) | #10B981 |
| Shelter (amber) | #F59E0B |
| Danger (red) | #EF4444 |
| Accent (blue) | #3B82F6 |

Full RTL Hebrew layout throughout.

## Configuration

See config/ directory for:
- Supabase connection details
- OREF API configuration
- Socket.IO endpoint
- City coordinates mapping

## Related

- **Capacitor (native) version**: [github.com/yehudawin/SafeStatus](https://github.com/yehudawin/SafeStatus)
- **Base44 Editor**: [app.base44.com/apps/69a4ac32f2a0ec7cb00c940c](https://app.base44.com/apps/69a4ac32f2a0ec7cb00c940c/editor/preview)
