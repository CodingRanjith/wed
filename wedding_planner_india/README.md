# Wedding Diary — Indian Wedding OS

A production-grade Flutter application for planning South Indian and pan-Indian weddings. Built with **Clean Architecture**, **feature-first** folder structure, and **BLoC** state management.

## Features

- **Onboarding** — Multi-step wedding setup (bride/groom, date, type, budget, guests)
- **Dashboard** — Countdown, budget overview, tasks, ceremonies, expenses
- **Timeline Planner** — 365 days → Wedding Day → After Marriage task stages
- **Ceremony Planner** — Tamil Hindu ceremonies (Ponnu Paarkum, Muhurtham, etc.)
  - Add, remove, reorder, skip, custom ceremonies
  - Per-ceremony checklist, date, venue, notes
- **Budget Tracker** — Category-wise budget with pie chart & expense logging
- **Guest Management** — RSVP, food preference, side tracking
- **Profile Hub** — Links to vendors, jewelry, saree, documents, reports (scaffolded)
- **Settings** — Dark mode, language (English/Tamil), backup placeholder
- **Offline-first** — Hive + Drift (SQLite) local storage

## Architecture

```
lib/
├── core/           # DI, router, theme, constants, widgets, utils
├── data/           # Database (Drift), local datasources
├── domain/         # Entities, repository contracts
├── features/       # Feature-first modules (presentation + bloc)
│   ├── onboarding/
│   ├── home/
│   ├── planner/
│   ├── budget/
│   ├── guests/
│   ├── ceremonies/
│   ├── profile/
│   └── settings/
├── l10n/           # Localization (EN, TA)
├── app.dart
└── main.dart
```

## Tech Stack

| Layer | Technology |
|-------|------------|
| State Management | flutter_bloc |
| Navigation | go_router |
| DI | get_it |
| Local DB | Drift (SQLite) |
| Key-Value | Hive |
| UI | Material 3, Google Fonts |
| Charts | fl_chart |
| i18n | flutter gen-l10n |

## Getting Started

```bash
cd wedding_planner_india
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Data storage (100% offline)

- **No backend** — all data stays on your device (SQLite + Hive)
- **Create Backup** — export wedding data to a `.json` file
- **Restore Backup** — after reinstall or new phone, upload backup to continue
- **30-day reminders** — local notifications on Android/iOS (no server)

### Backup flow

1. Settings → **Create Backup** → save file (Drive, email, USB)
2. Uninstall app or switch device
3. Install app → Settings → **Restore from Backup**
4. Select your `.json` file — all data returns

## Web support

Drift on web requires WASM assets in `web/`:

- `sqlite3.wasm` (from [sqlite3 releases](https://github.com/simolus3/sqlite3.dart/releases))
- `drift_worker.js` (from [drift releases](https://github.com/simolus3/drift/releases))

These are already included. After code changes, restart with a full refresh:

```bash
flutter run -d chrome
```

For best performance in production, serve with COOP/COEP headers (optional).

## Free live map (Nearby Mahals) — no API key

The mahal map uses **100% free** services. No Google Cloud account, no billing, no API key.

| Service | Provider | Cost |
|---------|----------|------|
| Map tiles | [OpenStreetMap](https://www.openstreetmap.org/) | Free |
| Live GPS | Device GPS (`geolocator`) | Free |
| Driving route | [OSRM](https://project-osrm.org/) | Free |
| Turn-by-turn nav | Google Maps **app** (external link) | Free for user |

### Live features (all free)

- GPS updates every ~25 meters with **LIVE** badge
- Mahal list auto-refreshes as you move
- Range filter: 1 km / 5 km / 8 km circle on map
- Directions with route line on map
- Tap **Open in Google Maps App** for navigation (opens user's phone app, no API key in your app)

### Run

```bash
flutter run -d chrome   # web
flutter run             # Android / Windows
```

Allow location permission when prompted.

To enable cloud sync, auth, and push notifications:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Then add Firebase packages and wire `FirebaseService` in `core/di/injection.dart`.

## Supported Wedding Types

Tamil Hindu, Tamil Christian, Tamil Muslim, Telugu, Kannada, Kerala Hindu, North Indian, Inter-caste, Love Marriage, Court Marriage, Destination, Custom

## Premium Modules (Scaffolded)

- AI Assistant
- Vendor Marketplace
- Family Sharing
- Cloud Sync
- EMI & Savings Calculator
- Saree / Jewelry / Makeup Planners
- Document Vault
- Honeymoon Planner

## License

Private — All rights reserved.
