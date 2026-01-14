# Changelog

## [1.1.1] - 2026-01-14

### Changed
- Added automatic fallback to system theme (light/dark) when no theme is saved.
- Expanded `smart_lib_theme.dart` exports to include all theme data components (app bar, buttons, colors, etc.).

## [1.1.0] - 2026-01-14

### Changed
- Added barrel file `smart_lib_theme.dart` that re-exports the main public API classes for easier imports.
- Fixed theme restoration on app startup by initializing `AppThemeBloc` with the persisted theme.
- Updated Kotlin Gradle plugin to `2.1.0` in the example Android project to match latest Flutter requirements.

## [1.0.5] - 2026-01-13

### Changed
- Bug fix.

## [1.0.4] - 2025-05-04

### Changed
- Improved [README.md](README.md) formatting and wording.

## [1.0.3] - 2025-05-04

### Changed
- Improved [README.md](README.md) formatting and wording.

## [1.0.2] - 2025-05-04

### Changed
- Refined documentation in [README.md](README.md).

## [1.0.1] - 2025-05-04

### Changed
- Minor updates to [README.md](README.md).

## [1.0.0] - 2025-05-04

### Added
- Initial release of `smart_lib_theme`.