[1.1.2] Anomaly DevTools - Profiler & Logger

**Creator:** CDEV

**Short Description:**
A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides zero-code performance profiling and structured logging for any mod. Includes a full in-game ImGui interface for real-time monitoring.

**Description:**
Anomaly DevTools is designed to help modders optimize and debug their work without invasive code changes. Version 1.1.2 brings major performance improvements (2x FPS when profiling!) and new features like timed profiling and minimal mode.

**Key Features:**
*   **Zero-Code Profiling:** Profile any Lua module without modifying its source code.
*   **Live Statistics:** View real-time function timing (calls, average/min/max/total ms).
*   **Module Browser:** Built-in UI to discover and select modules to profile from `_G`.
*   **Profiling Presets:** Save and load your profiling configurations for different debugging scenarios.
*   **Profile on Load:** Automatically start profiling when the game loads or transitions between locations (optional).
*   **Timed Profiling:** Auto-stop profiling after a specified duration (1-300 seconds).
*   **Minimal Mode:** Hide stats table for maximum FPS during data collection.
*   **Structured Logging:** Advanced logging with severity levels (DEBUG, INFO, WARN, ERROR), custom categories, and filtering.
*   **CSV Export:** Export profiling data to CSV for external analysis.
*   **Flamegraph Export:** Export call stack data in collapsed stacks format (`.folded`) for visualization in external tools like FlameGraph.pl, Inferno, and speedscope.
*   **ImGui Interface:** Self-contained UI panel for controlling the profiler and viewing logs.

**What's New in v1.1.2:**
*   ⚡ **Major Performance:** 2x FPS improvement when profiling! (~40 FPS vs ~22 FPS)
*   **New:** Timed Profiling - auto-stop after specified duration
*   **New:** Minimal Mode - hide stats table for max FPS during flamegraph collection (~50 FPS)
*   **New:** Row limiting controls (All/50/100/200) - default 100 rows
*   **Improved:** Flamegraph export button disabled when no data collected
*   **Improved:** Cleaner UI with simplified Display controls

**Usage:**
1.  Start the game.
2.  Open the ImGui menu (default: **F1** or **Ins**).
3.  Navigate to the **DevTools** menu.
4.  Select **Profiler** or **Logs** to open the windows.
5.  Enable "Profile on Load" to automatically start profiling on game start.
