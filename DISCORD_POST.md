[1.2.2] Anomaly DevTools - Profiler & Logger

**Creator:** CDEV

**Short Description:**
A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides zero-code performance profiling and structured logging for any mod. Includes a full in-game ImGui interface for real-time monitoring.

**Key Features:**
*   **Zero-Code Auto-Discovery:** Profile any Lua module without modifying its source code—just load your mod normally and DevTools discovers it automatically.
*   **Live Statistics:** View real-time function timing (calls, avg/median/min/max/total ms).
*   **Module Browser:** Built-in UI to view active modules (optional fine-tuning available).
*   **Profiling Presets:** Save and load your profiling configurations for different debugging scenarios.
*   **Profile on Load:** Automatically start profiling when the game loads or transitions between locations (optional).
*   **Timed Profiling:** Auto-stop profiling after a specified duration (1-300 seconds).
*   **Minimal Mode:** Hide stats table for maximum FPS during data collection.
*   **Structured Logging:** Advanced logging with severity levels (DEBUG, INFO, WARN, ERROR), custom categories, and filtering.
*   **CSV Export:** Export profiling data to CSV for external analysis.
*   **Flamegraph Export:** Export call stack data in collapsed stacks format (`.folded`) for visualization in external tools like FlameGraph.pl, Inferno, and speedscope.
*   **ImGui Interface:** Self-contained UI panel for controlling the profiler and viewing logs.

**What's New in v1.2.2:**

**Critical Fixes:**
*   **Fixed:** Exponential function count growth when repeatedly starting/stopping profiling
*   **Fixed:** Auto-rewrap feature not running (now properly executes at intervals)
*   **Fixed:** Decimal precision regression with toggleable high-precision mode

**New Features:**
*   **New:** Custom module colors with color picker UI - set your own colors and persist with presets
*   **New:** High precision display mode (6 decimal places) for detailed analysis
*   **New:** Elapsed time tracking during profiling sessions
*   **New:** Improved preset management with dropdown selector and better save/load workflow
*   **New:** Auto-rewrap logging to DevTools logger for better visibility

**UI Improvements:**
*   **Added:** Comprehensive tooltips for all UI controls
*   **Improved:** Better preset save/load workflow with visual feedback
*   **Improved:** Organized filesystem structure (`devtools/` folder for all exports)

**Usage:**
1.  Start the game.
2.  Open the ImGui menu (default: **F11**).
3.  Navigate to the **DevTools** menu.
4.  Select **Profiler** or **Logs** to open the windows.
5.  Enable profiling and watch real-time stats—no configuration needed.

**Advanced (Optional):**
For advanced users who want manual control, see documentation.md for the registration API. Most users don't need this—auto-discovery handles everything automatically.
