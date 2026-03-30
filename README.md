# 🔧 Anomaly DevTools - Profiler & Logger

**Find FPS bottlenecks in your S.T.A.L.K.E.R. Anomaly mods in seconds. Zero code changes required.**

---

> 💡 **Don't know where your mod is slow? DevTools profiles every function automatically and shows you real-time performance data.**

---

## ⚡ Quick Start

1. Install the mod
2. Load the game
3. Press **F11** → DevTools → Profiler
4. Click **Enable Profiling**
5. Play and watch FPS bottlenecks appear in real-time

**That's it.** No code modifications. No registration. No configuration.

---

## 🎯 What It Does

- **Zero-Code Profiling**: Automatically discovers and profiles all your Lua modules
- **Real-Time Stats**: See which functions are slow—calls, avg/median/min/max/total execution time
- **Flamegraph Export**: Visualize call stacks to find exactly where CPU time goes
- **CSV Export**: Analyze data in spreadsheets
- **Structured Logging**: Debug logs with categories, severity levels, and filtering

---

## 📦 Installation

### Mod Organizer 2
1. Download
2. Click "Install Mod"
3. Activate
4. Play

### Manual
1. Extract zip
2. Copy `gamedata` folder contents to your Anomaly `gamedata` folder
3. Play

---

## 💡 Use Cases

| Goal | How to Use DevTools |
|------|-------------------|
| **Find FPS bottlenecks** | Profile all modules → Play normally → Look for high "Total (ms)" values |
| **Optimize a slow script** | Enable → Play scenario → Export Flamegraph → Visualize in SpeedScope |
| **Compare mod performance** | Profile Mod A → Export CSV → Profile Mod B → Compare spreadsheets |
| **Debug conflicts** | Profile each mod separately and see call counts/timing |
| **Understand game systems** | Profile vanilla to see callback execution order and timing |

---

## ⚙️ Key Features

✅ **Zero configuration** - Auto-discovers modules
✅ **No code changes** - Works with any mod as-is  
✅ **Real-time monitoring** - Live stats while playing  
✅ **Advanced exports** - CSV + Flamegraph for detailed analysis  
✅ **Structured logging** - Debug tool with categories and filtering  
✅ **Presets** - Save profiling configurations  
✅ **Profile on load** - Auto-start profiling at game start  

---

## 📖 Documentation

- **Full Guide**: See [documentation.md](documentation.md) for detailed usage, API reference, and workflows
- **In-Game Help**: Open ImGui menu (F11) → DevTools → Profiler for built-in tooltips

---

## 🔗 Links

📍 **[ModDB Page](https://www.moddb.com/mods/anomaly-devtools)** - Download here  
💬 **[Discord Thread](https://discord.gg/stalkeranomaly)** - Discuss, report bugs, request features  
📚 **[Full Documentation](documentation.md)** - Advanced usage, workflows, API  

---

## ⚠️ Important

- **Performance Impact**: Profiling adds overhead—the more modules/functions profiled, the greater the impact
- **Too many modules**: Profiling 100+ modules simultaneously can cause noticeable FPS drops—use presets to profile subsets
- **Minimal Mode**: Hides stats table for maximum FPS during collection

---

## 🎓 Workflow Examples

### Find & Fix Performance Issues

```
1. Enable profiling (all modules)
2. Play the problematic scenario for 30-60 seconds
3. Sort by "Total (ms)" or "Avg (ms)" 
4. Identify the slowest function
5. Optimize that function
6. Re-profile to measure improvement
```

### Deep Analysis with Flamegraph

```
1. Enable profiling
2. Play scenario (2-5 minutes for good data)
3. Export Flamegraph
4. Open https://www.speedscope.app/
5. Drag-and-drop the .folded file
6. Look for thick stacks (most CPU time)
7. Click to drill down into call chains
8. Optimize the bottleneck functions
```

---

## 📝 Version 1.3.5

✨ **New Features:**
- **JSONL Live Streaming (Experimental)**: Real-time streaming export of function call data in JSONL format for post-processing and external tool integration
- **JSONL Stream Controls (Experimental)**: UI controls for starting/stopping JSONL streams and exporting summaries

🔧 **Changes:**
- **Shared State Refactoring**: Profiler scripts now use a shared state module for improved consistency
- **Export Logic Cleanup**: Streamlined export code paths for CSV, flamegraph, and JSONL

---

## 📝 Version 1.3.0

🔧 **Major Refactoring & Fixes:**
- **Code Refactoring**: Split monolithic codebase into modular architecture for better maintainability
- Fixed timed profiling reliability issues
- Fixed preset load/delete operations
- Fixed dropdown display issues
- Various UI improvements

✨ **New Features:**
- **Self-Time Tracking**: Track time spent in functions excluding child calls (total, avg, median, min, max)
- **Parent Function Tracking**: See caller relationships and most common callers for each function
- **Call Graph Export**: Export call graphs in DOT format for visualization
- **Timed Profiling Auto-Export**: CSV and flamegraph automatically export when timed profiling completes

📦 **Previous Versions:**
- **v1.2.2**: Critical fixes for function rewrapping, auto-rewrap, custom module colors
- **v1.2.1**: Median execution time, toggleable columns, color mapping fix
- **v1.2.0**: LuaBind class method profiling, verbose logging flag  

---

**Created by:** CDEV  
**For:** S.T.A.L.K.E.R. Anomaly Modding Community

---

**Happy optimizing! 🚀**
