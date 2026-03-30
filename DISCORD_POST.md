[1.3.5] Anomaly DevTools - Profiler & Logger

**Creator:** CDEV

**Short Description:**
A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides zero-code performance profiling and structured logging for any mod. Includes a full in-game ImGui interface for real-time monitoring.

**Key Features:**
*   **Zero-Code Auto-Discovery:** Profile any Lua module without modifying its source code—just load your mod normally and DevTools discovers it automatically.
*   **Live Statistics:** View real-time function timing (calls, avg/median/min/max/total ms).
*   **Self-Time Tracking:** See time spent in functions excluding child calls for accurate bottleneck identification.
*   **Parent Function Tracking:** Track caller relationships and identify most common callers.
*   **Module Browser:** Built-in UI to view active modules (optional fine-tuning available).
*   **Profiling Presets:** Save and load your profiling configurations for different debugging scenarios.
*   **Profile on Load:** Automatically start profiling when the game loads or transitions between locations (optional).
*   **Timed Profiling:** Auto-stop profiling after a specified duration (1-300 seconds) with auto-export.
*   **Minimal Mode:** Hide stats table for maximum FPS during data collection.
*   **Structured Logging:** Advanced logging with severity levels (DEBUG, INFO, WARN, ERROR), custom categories, and filtering.
*   **CSV Export:** Export profiling data to CSV for external analysis.
*   **Flamegraph Export:** Export call stack data in collapsed stacks format (`.folded`) for visualization in external tools like FlameGraph.pl, Inferno, and speedscope.
*   **Call Graph Export:** Export call graphs in DOT format for visualization in Graphviz.
*   **ImGui Interface:** Self-contained UI panel for controlling the profiler and viewing logs.

**What's New in v1.3.5:**

**Major Changes:**
*   **JSONL Live Streaming (Experimental):** New real-time streaming export of function call data in JSONL format. Captures individual function calls as they happen for post-processing and external tool integration. Includes configurable buffer management for efficient disk I/O.
*   **JSONL Stream Controls (Experimental):** UI controls for starting/stopping JSONL streams and exporting stream summaries directly from the profiler panel.
*   **Shared State Refactoring:** Profiler scripts now use a shared state module for flamegraph and export checks, reducing code duplication and improving consistency across modules.
*   **Export Logic Cleanup:** Streamlined export code paths for CSV, flamegraph, and JSONL with clearer separation of concerns.

**Usage:**
1.  Start the game.
2.  Open the ImGui menu (default: **F11**).
3.  Navigate to the **DevTools** menu.
4.  Select **Profiler** or **Logs** to open the windows.
5.  Enable profiling and watch real-time stats—no configuration needed.

**Advanced (Optional):**
For advanced users who want manual control, see documentation.md for the registration API. Most users don't need this—auto-discovery handles everything automatically.
