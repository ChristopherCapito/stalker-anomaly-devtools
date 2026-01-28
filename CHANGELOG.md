# Changelog

All notable changes to Anomaly DevTools will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.2] - 2026-01-28

### Added
- **Custom Module Colors**: Users can now set custom colors for modules via color picker UI. Colors are persisted with presets and override auto-assigned colors.
- **High Precision Display Mode**: New toggleable precision mode for timing values (6 decimal places) for detailed analysis. Default remains compact format for performance.
- **Elapsed Time Display**: Statistics table now shows elapsed measurement time during profiling (e.g., "Total: X ms across Y calls (elapsed: Z s)").
- **Preset Dropdown Selector**: Improved preset management with dropdown/combo selector, Load/Delete buttons, and streamlined save workflow.
- **Auto-Rewrap Logging**: Auto-rewrap operations now log to DevTools logger (PERF category) for better visibility and debugging.
- **Comprehensive Tooltips**: Added tooltips for all UI controls including Start/Stop Profiling, Reset Stats, Export CSV, Timed Profiling, Re-scan, Auto Rewrap, and more.

### Fixed
- **Critical: Function Rewrapping Bug**: Fixed exponential function count growth when repeatedly starting/stopping profiling or clicking "Re-scan Now". Implemented identity-based wrapper tracking to prevent double-wrapping.
- **Auto-Rewrap Not Running**: Fixed bug where auto-rewrap feature was implemented but never actually executed. Auto-rewrap now properly runs at specified intervals.
- **Preset Saving Failures**: Improved error handling and user feedback for preset saving. Added clear error messages showing file paths when directory creation fails.
- **Decimal Precision Regression**: Fixed precision loss in v1.2.0 by making precision toggleable with "not super precise" as default for performance.
- **Module Color Persistence**: Fixed issue where custom module colors were not being honored. Custom colors now persist across sessions and are saved with presets.
- **Userdata Handling**: Enhanced safety checks for LuaBind class objects (userdata) when unwrapping functions, preventing crashes.

### Changed
- **Filesystem Restructure**: Reorganized file structure to use dedicated `devtools/` folder:
  - Presets: `devtools/presets/devtools_presets.txt`
  - CSV exports: `devtools/devtools_profiler_export.csv`
  - Flamegraph exports: `devtools/devtools_flamegraph.folded`
- **Preset Format**: Presets now save custom module colors along with module selection and flamegraph state.
- **UI Layout**: Improved preset management UI with better grouping and visual feedback for save operations.

## [1.2.1] - 2026-01-25

### Added
- **Median Execution Time**: New median statistic provides more representative performance data than average alone
- **Toggleable Columns**: Individual column visibility controls (Calls/Avg/Median/Min/Max/Total) - defaults to Calls/Avg/Median

### Fixed
- **Module Color Consistency**: Fixed color mapping bug where function rows showed wrong module colors in stats table

### Changed
- **Documentation**: Overhauled to emphasize zero-config auto-discovery workflow

## [1.2.0] - 2026-01-23

### Added
- **LuaBind Class Method Profiling**: Auto-profiling now wraps LuaBind class methods (e.g., `utils_ui.UICellItem.Update`) by assigning wrappers through `__newindex` based on source parsing.
- **Verbose Logging Flag**: Set `DEVTOOLS_VERBOSE` to enable or silence DevTools console output.

### Fixed
- **Re-scan Duplicate Wrapping**: Prevented repeated wrapping on every rescan by tracking paths already wrapped.
- **Cross-Module Name Pollution**: Avoided wrapping functions that belong to other modules, preventing truncated/mangled names in exports.

### Changed
- **Console Noise**: Default console output is now quiet unless `DEVTOOLS_VERBOSE` is enabled.

## [1.1.2] - 2026-01-21

### Added
- **Timed Profiling**: New "Timed" checkbox with duration input allows automatic profiling stop after a specified time (1-300 seconds). Perfect for consistent benchmark recordings.
- **Minimal Mode**: New toggle to hide the stats table entirely during profiling. Provides maximum FPS (~50 vs ~22) while collecting data for flamegraph export.
- **Row Limiting**: New display controls with row limit buttons (All/50/100/200). Default 100 rows provides excellent performance (~40 FPS vs ~22 FPS with all rows).
- **Column Visibility Toggle**: "Show all columns" checkbox to optionally display the Min (ms) column.

### Changed
- **Major Performance Improvements**: Stats table now caches data and only rebuilds every 150ms instead of every frame. Pre-computed colors avoid repeated fcolor() allocations. Result: **2x FPS improvement** when profiling many modules.
- **Cleaner UI**: Simplified "Display" controls section. Removed color toggles and refresh rate buttons (testing showed negligible impact).
- **Flamegraph Button UX**: Export Flamegraph button is now disabled (grayed out) when no flamegraph data has been collected.

### Removed
- Color toggle checkboxes (colors always on - negligible performance impact per testing)
- Refresh rate buttons (fixed at optimal 150ms - negligible impact per testing)
- Unused code: `COLOR_DARK_GRAY`, `COLOR_LIGHT_GRAY` constants, `module_browser_expanded` variable

## [1.1.1] - 2026-01-20

### Added
- **Callback Grouping in Flamegraph**: Callbacks via `axr_main.make_callback` are now grouped by their specific callback name (e.g., `on_game_start`, `actor_on_update`) in the flamegraph, making it much easier to analyze which callbacks consume the most time.
- **get_stats() Summary Mode**: Calling `get_stats()` without arguments now prints a summary of all tracked functions instead of crashing.

### Fixed
- **Printf format strings**: Fixed all printf calls to use string concatenation instead of format specifiers (`%d`, `%s`), as STALKER's printf does not support format string interpolation.
- **Nil argument crash**: Fixed crash when calling `get_stats()` or `init_stats()` with nil argument.

## [1.1.0] - 2024-12-XX

### Added
- **Profile on Load**: New "Profile on Load" checkbox in the profiler UI that automatically starts profiling when the game loads or transitions between locations. Uses the special `_AUTOLOAD_` preset to save your module selection.
- **Auto-start on game load**: The profiler now checks for the `_AUTOLOAD_` preset during `on_game_start()` and automatically enables profiling if found, allowing programmatic profiling initialization without user interaction.
- **Flamegraph Export**: New flamegraph data capture and export functionality. Record call stack snapshots during profiling and export them in collapsed stacks format (`.folded`) for visualization in external tools like FlameGraph.pl, Inferno, and speedscope.
- **Early Script Loading (DLTX)**: DevTools now loads before `start_game_callback` via DLTX, allowing capture of the complete game initialization sequence including `_g.start_game_callback` and `axr_main.on_game_start`.

### Changed
- **UI Improvement**: The "Select Filtered" button in the Module Browser now displays "Select All" when no search filter is applied, providing clearer context to users.

### Fixed
- **Statistics continue updating after stop**: Fixed a bug where clicking "Stop Profiling" did not immediately halt statistics updates. The `disable()` function now sets the global `ENABLED` flag to `false` at the very start, ensuring all timing collection (including manual `start_timer`/`end_timer` calls) stops instantly when profiling is disabled.

## [1.0.0] - 2024-01-01

### Added
- Initial release of Anomaly DevTools
- Zero-code profiling system with automatic function wrapping
- Module browser UI for discovering and selecting modules to profile
- Profiling presets system for saving/loading module selections
- Real-time function timing statistics (calls, avg/min/max/total ms)
- Structured logging system with severity levels and categories
- Category browser with visual color coding
- CSV export functionality for profiling data
- ImGui user interface for profiler and log viewer
- Manual timing API for custom code sections
- Stack overflow protection and safety mechanisms