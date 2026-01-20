[1.1.1] Anomaly DevTools - Profiler & Logger

**Creator:** CDEV

**Short Description:**
A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides zero-code performance profiling and structured logging for any mod. Includes a full in-game ImGui interface for real-time monitoring.

**Description:**
Anomaly DevTools is designed to help modders optimize and debug their work without invasive code changes. Version 1.1.1 improves flamegraph callback grouping and fixes several stability issues.

**Key Features:**
*   **Zero-Code Profiling:** Profile any Lua module without modifying its source code.
*   **Live Statistics:** View real-time function timing (calls, average/min/max/total ms).
*   **Module Browser:** Built-in UI to discover and select modules to profile from `_G`.
*   **Profiling Presets:** Save and load your profiling configurations for different debugging scenarios.
*   **Profile on Load:** Automatically start profiling when the game loads or transitions between locations (optional).
*   **Structured Logging:** Advanced logging with severity levels (DEBUG, INFO, WARN, ERROR), custom categories, and filtering.
*   **CSV Export:** Export profiling data to CSV for external analysis.
*   **Flamegraph Export:** Export call stack data in collapsed stacks format (`.folded`) for visualization in external tools like FlameGraph.pl, Inferno, and speedscope.
*   **ImGui Interface:** Self-contained UI panel for controlling the profiler and viewing logs.

**What's New in v1.1.1:**
*   **Improved:** Flamegraph now groups callbacks by their specific name (e.g., `on_game_start`, `actor_on_update`)
*   **New:** `get_stats()` now shows a summary when called without arguments
*   **Fixed:** Printf format string issues causing literal `%d`/`%s` output
*   **Fixed:** Crash when calling `get_stats()` with nil argument

**Installation Guide:**
1.  **Mod Organizer 2 (Recommended):**
    *   Download the mod zip file.
    *   In MO2, click "Install Mod" and select the zip file.
    *   Enable the mod in your load order.

2.  **Manual Installation:**
    *   Extract the zip file.
    *   Copy the contents of the `gamedata` folder to your Anomaly installation's `gamedata` folder.

**Usage:**
1.  Start the game.
2.  Open the ImGui menu (default: **F1** or **Ins**).
3.  Navigate to the **DevTools** menu.
4.  Select **Profiler** or **Logs** to open the windows.
5.  Enable "Profile on Load" to automatically start profiling on game start.
