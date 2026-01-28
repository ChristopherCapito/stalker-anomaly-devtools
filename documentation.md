# 📖 Anomaly DevTools - Full Documentation

**Complete guide for performance profiling and structured logging in S.T.A.L.K.E.R. Anomaly**

---

## Table of Contents

- [What is Anomaly DevTools?](#what-is-anomaly-devtools)
- [Key Features](#key-features)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Use Cases](#use-cases)
- [Features in Detail](#features-in-detail)
- [What's New in v1.2.2](#whats-new-in-v122)
- [Important Notes](#important-notes)
- [Files Included](#files-included)
- [Advanced Usage](#advanced-usage)
- [Contributing](#contributing)

---

## What is Anomaly DevTools?

DevTools is a standalone developer toolkit that lets you **profile any Lua mod in seconds without touching a single line of code**. Want to know why your mod is slow? DevTools tells you exactly which functions are eating your FPS—in real-time, with a clean ImGui interface.

Perfect for modders who want to **optimize their work, debug performance issues, and understand game behavior** without invasive code instrumentation.

---

## Key Features

### 🚀 Zero-Code Profiling
- **No code modifications needed** — just load your mod normally
- Automatically discovers all Lua modules in `_G`
- Start profiling with one click
- Works with any mod, any script

### 📊 Real-Time Performance Monitoring
- Track **calls, execution time (avg/median/min/max/total), and more**
- Live updates as functions execute
- Sort by any metric instantly
- Color-coded by module for easy tracking

### 🎮 In-Game ImGui Interface
- Sleek, integrated control panel (press **F11** to open)
- **Profiler tab**: View live function statistics
- **Logs tab**: Structured logging with filters and severity levels
- **Module browser**: Select what to profile (optional)
- Resizable, moveable windows

### 💾 Export & Analysis Tools
- **CSV Export**: Dump statistics for spreadsheet analysis
- **Flamegraph Export**: Visualize call stacks in [SpeedScope](https://www.speedscope.app/), [Inferno](https://www.brendangregg.com/flamegraph.html), or [FlameGraph.pl](https://github.com/brendangregg/FlameGraph)
- Perfect for identifying bottlenecks and optimization targets

### ⚙️ Advanced Profiling Features
- **Profiling Presets**: Save/load different module selections for different scenarios
- **Timed Profiling**: Auto-stop after a duration (1-300 seconds)
- **Minimal Mode**: Hide stats table for maximum FPS during collection
- **Profile on Load**: Auto-start profiling when game loads or transitions
- **LuaBind Class Method Support**: Profile class methods like `utils_ui.UICellItem.Update`

### 📝 Structured Logging
- **Custom categories** with colors and quick filters
- **Severity levels**: DEBUG, INFO, WARN, ERROR
- **File output** for post-game analysis
- Clean, organized log viewer in-game

---

## Installation

### Mod Organizer 2 (Recommended)
1. Download the latest release
2. In MO2, click **"Install Mod"**
3. Select the zip file
4. Activate and load the game

### Manual Installation
1. Extract the zip file
2. Copy the `gamedata` folder contents to your Anomaly `gamedata` folder
3. Load the game

---

## Quick Start (30 Seconds)

1. **Install the mod** ✓
2. **Load the game** ✓
3. **Press F11** to open ImGui menu
4. **Navigate to DevTools → Profiler**
5. **Enable profiling** and watch the stats roll in

That's it. No code changes. No registration. No hassle.

---

## Use Cases

**"My mod is causing FPS drops"**
→ Use DevTools to identify which functions are slow

**"I need to optimize my script"**
→ Export to flamegraph, visualize the call stack, find the bottleneck

**"Which mods are conflicting?"**
→ Profile each mod separately, compare execution times and call counts

**"I want to understand how game systems work"**
→ Profile vanilla callbacks and systems to see execution flow and timing

**"I'm debugging a performance regression"**
→ Save profiling presets, compare before/after with CSV exports

---

## Features in Detail

### Profiler Tab

| Control | Purpose |
|---------|---------|
| **Enable Profiling** | Checkbox to turn profiling on/off |
| **Profile on Load** | Auto-start profiling when game loads or transitions |
| **Timed Profiling** | Duration spinner (1-300 seconds) — auto-stops after time expires |
| **Minimal Mode** | Hide stats table for maximum FPS during collection |
| **Module Browser** | Expand to select/deselect modules (optional — auto-discovery is default) |
| **Columns** | Toggle individual columns: Calls/Avg/Median/Min/Max/Total |
| **Row Limit** | Display All/50/100/200 rows (default: 100 for best performance) |
| **Sort** | Click column headers to sort by any metric |

### Statistics Metrics

- **Calls**: Number of times the function was called
- **Avg (ms)**: Average execution time per call
- **Median (ms)**: Median execution time (represents typical performance better than average)
- **Min (ms)**: Fastest single call
- **Max (ms)**: Slowest single call
- **Total (ms)**: Total cumulative time across all calls

### Export Options

**CSV Export**
- Dumps all statistics to a `.csv` file
- Perfect for spreadsheet analysis and trend tracking
- Includes all metrics (Calls, Avg, Median, Min, Max, Total)

**Flamegraph Export**
- Exports call stack data in collapsed stacks format (`.folded`)
- Visualize in [SpeedScope](https://www.speedscope.app/) (recommended, no installation needed)
- Or use [FlameGraph.pl](https://github.com/brendangregg/FlameGraph) or [Inferno](https://www.brendangregg.com/flamegraph.html)
- Shows which call stacks consume the most time

### Logging Tab

- **Severity Levels**: DEBUG (blue), INFO (green), WARN (yellow), ERROR (red)
- **Custom Categories**: Organize logs by system/module
- **Filters**: Show/hide logs by category
- **File Output**: Logs also written to disk for post-game review
- **Clear Logs**: Wipe current log history

---

## What's New in v1.2.2

- 🔧 **Critical Fixes**: Fixed exponential function count growth bug, auto-rewrap not running, and decimal precision regression
- 🎨 **Custom Module Colors**: Set custom colors for modules via color picker UI, persisted with presets
- 📊 **High Precision Mode**: Toggleable 6-decimal precision display for detailed analysis
- ⏱️ **Elapsed Time Tracking**: Shows elapsed measurement time during profiling sessions
- 🎯 **Improved Preset Management**: Dropdown selector with better save/load workflow
- 📝 **Auto-Rewrap Logging**: Auto-rewrap operations now log to DevTools logger
- 💡 **Comprehensive Tooltips**: Added tooltips for all UI controls
- 📁 **Filesystem Restructure**: Organized `devtools/` folder structure for all exports

## Previous Versions

### v1.2.1
- Median execution time statistic
- Toggleable column visibility
- Fixed module color mapping bug

### v1.2.0
- ✨ **LuaBind class method profiling** - Now wraps class methods from bindings (e.g., `utils_ui.UICellItem.Update`)
- 🔇 **`DEVTOOLS_VERBOSE` flag** - Control console output noise
- 🐛 **Fixed re-scan duplicate wrapping** - No more repeated wrapping on rescans
- 🎯 **Fixed cross-module name pollution** - Correct function paths in exports

---

## Important Notes

### Performance Considerations

- **Profiling Overhead**: Adds overhead that increases with the number of wrapped functions
- **Too Many Modules**: Profiling 100+ modules simultaneously can cause noticeable FPS drops
- **Solution**: Use presets to profile subsets at a time
- **Minimal Mode**: Hides stats table to maintain FPS during collection

### Configuration

- Set `DEVTOOLS_VERBOSE = true` in config to debug DevTools itself
- Default is `DEVTOOLS_VERBOSE = false` (quiet mode)
- Presets are saved automatically to `user_files/devtools_presets.ltx`

---

## Files Included

| File | Purpose |
|------|---------|
| `devtools_profiler.script` | Core profiling engine with auto-discovery and statistics tracking |
| `devtools_imgui.script` | ImGui user interface and controls |
| `devtools_logging.script` | Structured logging system with categories and severity levels |
| `devtools_config.script` | Configuration and preset storage |
| `devtools_README.md` | In-game documentation reference |
| `mod_script_devtools_early.ltx` | DLTX config for early script loading |

---

## Advanced Usage

### Manual Profiling Control (For Advanced Users)

While auto-discovery is the recommended approach, you can manually control profiling if needed:

```lua
-- Register a specific module (optional)
devtools_profiler.register_module("my_custom_module")

-- Enable profiling
devtools_profiler.enable()

-- Get statistics
local stats = devtools_profiler.get_all_stats()

-- Disable profiling
devtools_profiler.disable()

-- Unregister a module
devtools_profiler.unregister_module("my_custom_module")
```

### Making Your Script Discoverable

For automatic profiling to work, store your scripts in `_G`:

```lua
-- Good - will be auto-discovered
_G.my_custom_module = {
    function_one = function() ... end,
    function_two = function() ... end,
}

-- Also good - profiler finds nested tables
_G.my_namespace = {
    utils = {
        helper_one = function() ... end,
        helper_two = function() ... end,
    }
}
```

### CSV Analysis Workflow

1. **Enable Profiling**: Select modules you want to profile
2. **Play**: Let the game run for the scenario you're testing (30 seconds - 5 minutes)
3. **Export**: Click "Export CSV"
4. **Analyze**: Open in Excel/LibreOffice/Google Sheets
5. **Optimize**: Sort by Total (ms) or Avg (ms) to find slow functions
6. **Repeat**: Profile again after optimization to measure improvement

### Flamegraph Analysis Workflow

1. **Enable Profiling**: Select modules
2. **Play**: Reproduce the scenario you're analyzing
3. **Export Flamegraph**: Click "Export Flamegraph"
4. **Visualize**: Open in [SpeedScope.app](https://www.speedscope.app/)
   - Drag-and-drop the `.folded` file
   - Look for thick stacks (high CPU time)
5. **Optimize**: Focus on the thickest call stacks first
6. **Verify**: Re-profile and compare

---

## Contributing

Found a bug? Have a feature request?

- **ModDB**: Report on the mod page
- **GitHub**: Open an issue
- **Discord**: Discuss in the GAMMA/Anomaly modding communities

---

## 📜 License & Credits

**Created by:** CDEV

**Version:** 1.2.2

**For:** S.T.A.L.K.E.R. Anomaly modding community

---

**Happy optimizing! 🚀**
