# Changelog

## [1.2.0] - 2026-09-25

### Fixed
- `AppThemeBuilder` no longer closes the app-wide theme bloc when it is removed from the tree (theme switching stopped working afterwards).
- Theme changes keep the current page and its state; custom `AppThemeExtension` colors now animate with the rest of the theme (`lerp` and `copyWith` were no-ops).
- The system-brightness fallback promised in 1.1.1 is now implemented: with no saved theme, the first theme matching the device brightness is used.
- Theme dependencies use a private service locator instead of the app's global `GetIt.instance`; `AppThemeManager.init` can be called more than once.
- Replaced deprecated `withOpacity` calls and added missing return types to the theme data helpers.

### Changed
- `AppThemeManager.changeTheme` and `getCurrentTheme` no longer need a `BuildContext` (the `context` parameter is deprecated).
- `AppThemeBuilder` passes a non-null `ThemeData` to its builder.
- Added `AppThemeManager.currentTheme`, `currentThemeKey` and `isInitialized`.
- Errors are thrown as `AppThemeException`; `init` rejects empty theme lists and duplicate keys.
- The new theme is applied immediately and persisted in the background.

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