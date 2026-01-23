[1.2.0] Anomaly DevTools - Profiler & Logger

**Creator:** CDEV

**Short Description:**
A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides zero-code performance profiling and structured logging for any mod. Includes a full in-game ImGui interface for real-time monitoring.

**Description:**
Anomaly DevTools is designed to help modders optimize and debug their work without invasive code changes. Version 1.2.0 adds LuaBind class method profiling and reduces console noise with a new verbose logging flag.

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

**What's New in v1.2.0:**
*   **New:** LuaBind class method profiling (e.g., `utils_ui.UICellItem.Update`)
*   **New:** `DEVTOOLS_VERBOSE` flag to toggle DevTools console output
*   **Fixed:** Re-scan no longer re-wraps the same functions
*   **Fixed:** Cross-module name pollution in wrapped function paths

**Usage:**
1.  Start the game.
2.  Open the ImGui menu (default: **F1** or **Ins**).
3.  Navigate to the **DevTools** menu.
4.  Select **Profiler** or **Logs** to open the windows.
5.  Enable "Profile on Load" to automatically start profiling on game start.
