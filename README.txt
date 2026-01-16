Anomaly DevTools - Profiler & Logger
=====================================

A standalone developer toolkit for S.T.A.L.K.E.R. Anomaly that provides performance profiling and structured logging for any mod.

INSTALLATION:
-------------
1. Install via Mod Organizer 2:
   - Download the mod zip file
   - In MO2, click "Install Mod" button
   - Select the zip file
   - MO2 will extract it automatically

2. Manual Installation (if not using MO2):
   - Extract the zip file
   - Copy the contents of the "gamedata" folder to your Anomaly installation's "gamedata" folder

FEATURES:
---------
- Zero-Code Profiling: Profile any Lua module without modifying its code
- Module Browser: UI to discover and select modules to profile
- Profiling Presets: Save and load module selections for quick switching
- Live Statistics: Real-time function timing (calls, avg/min/max/total ms)
- Structured Logging: Severity levels, categories, filtering, file output
- Category Browser: Visual category management with colors and quick toggles
- Self-Contained UI: ImGui panel with profiler stats and log viewer

USAGE:
------
1. Start the game
2. Open ImGui menu (default: F1)
3. Navigate to "DevTools" menu
4. Select "Profiler" or "Logs" to open the respective windows

For detailed documentation, see: gamedata/scripts/devtools_README.md

FILES INCLUDED:
---------------
- devtools_profiler.script - Core profiling engine
- devtools_logging.script - Structured logging system
- devtools_config.script - Configuration and presets storage
- devtools_imgui.script - ImGui user interface

AUTHOR:
-------
CDEV

VERSION:
--------
1.0.0
