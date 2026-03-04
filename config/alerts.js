/**
 * Alert System Configuration for SafeStatus
 *
 * Primary: Socket.IO real-time connection
 * Fallback: OREF HTTP polling (every 5 seconds when Socket.IO is down)
 */

// Primary: Socket.IO real-time alerts
export const SOCKET_IO_URL = 'https://redalert.orielhaim.com';

// Fallback: Pikud HaOref (OREF) official alert API
export const OREF_API_URL = 'https://www.oref.org.il/WarningMessages/alert/alerts.json';
export const OREF_API_KEY = 'OntGrPFApQESIYiePYAruCEIwVUEGrzqidMmQzfGXABAgxshUdIuzbbOdvGcPscK';
export const OREF_POLL_INTERVAL_MS = 5000;

// Alert category → Hebrew severity mapping
export const SEVERITY_MAP = {
  missiles: 'קריטי',      // Critical
  earthquakes: 'אזהרה',   // Warning
  // all others → 'מידע'  // Info
};
