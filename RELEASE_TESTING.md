# Anomaly DevTools - Release Testing Guide (v1.1.2)

This document provides a complete checklist of tests to perform before each release to prevent regressions.

---

## Pre-Test Setup

1. **Clean Install**
   - Remove any existing DevTools installation
   - Delete `appdata/devtools_presets.txt` if it exists
   - Start with a fresh Anomaly installation or MO2 profile

2. **Test Save**
   - Have a save file ready in the Zone (not main menu)
   - Preferably in a location with NPCs for AI-related testing

---

## 1. Installation Tests

### 1.1 MO2 Installation
- [ ] Download the release zip
- [ ] In MO2: Click "Install Mod" → Select zip
- [ ] Verify MO2 extracts correctly (no nested folders)
- [ ] Enable mod in load order
- [ ] Launch game → Verify no crashes on main menu

### 1.2 Manual Installation
- [ ] Extract zip manually
- [ ] Copy `gamedata` folder contents to Anomaly's `gamedata`
- [ ] Launch game → Verify no crashes on main menu

---

## 2. Basic UI Tests

### 2.1 Menu Access
- [ ] Press **F1** (or **Ins**) to open ImGui menu
- [ ] Navigate to **DevTools** menu
- [ ] Click **Profiler** → Window opens
- [ ] Click **Logs** → Window opens
- [ ] Both windows can be moved and resized
- [ ] Windows remember position after closing/reopening

### 2.2 Profiler Window Layout
- [ ] "Start Profiling" button visible
- [ ] "Module Browser" section expandable
- [ ] "Presets" section expandable
- [ ] "Flamegraph" section expandable
- [ ] Stats table area visible (empty initially)

---

## 3. Module Browser Tests

### 3.1 Module Discovery
- [ ] Expand "Module Browser"
- [ ] Click "Refresh" or wait for auto-discovery
- [ ] Verify module list populates (should see 100+ modules)
- [ ] Scroll through list → No crashes

### 3.2 Search/Filter
- [ ] Type "actor" in search box
- [ ] Verify list filters to show only matching modules
- [ ] Clear search → Full list returns
- [ ] Type nonsense (e.g., "xyzabc") → List shows no results

### 3.3 Selection
- [ ] Check a single module checkbox (e.g., `bind_stalker`)
- [ ] Verify it appears in "Selected Modules" count
- [ ] Click "Select All" (when no filter) → All modules selected
- [ ] Click "Deselect All" → All modules deselected
- [ ] Apply filter "bind_" → Click "Select Filtered" → Only filtered modules selected

---

## 4. Profiling Tests

### 4.1 Basic Start/Stop
- [ ] Select 3-5 modules (e.g., `bind_stalker`, `axr_main`, `ui_inventory`)
- [ ] Click "Start Profiling"
- [ ] Button changes to "Stop Profiling"
- [ ] Play the game for 10-15 seconds (move around, open inventory)
- [ ] Stats table populates with function names and timing data
- [ ] Click "Stop Profiling"
- [ ] Stats stop updating (verify by waiting 5 seconds)
- [ ] Button returns to "Start Profiling"

### 4.2 Stats Accuracy
- [ ] While profiling, verify columns show:
  - Function name (format: `module.function`)
  - Call count (increasing)
  - Avg ms (reasonable values, not 0 or astronomical)
  - Min/Max ms
  - Total ms
- [ ] Sort by "Total ms" → Highest consumers at top
- [ ] Sort by "Calls" → Most called functions at top

### 4.3 Re-enable After Stop
- [ ] Stop profiling
- [ ] Start profiling again
- [ ] Verify stats reset and begin collecting fresh data
- [ ] No crashes or duplicate entries

### 4.4 Timed Profiling
- [ ] Check "Timed" checkbox next to Start button
- [ ] Enter duration (e.g., "5" seconds)
- [ ] Click "Start Profiling"
- [ ] Verify countdown timer shows "Auto-stop in X.Xs"
- [ ] Wait for timer to expire
- [ ] Verify profiling stops automatically
- [ ] Verify console shows "[DEVTOOLS] Timed profiling auto-stopped after 5s"

### 4.5 Timed Profiling - Manual Stop
- [ ] Enable timed profiling with 30 seconds
- [ ] Start profiling
- [ ] Click "Stop Profiling" before timer expires
- [ ] Verify profiling stops immediately
- [ ] Verify timed mode checkbox is unchecked

---

## 5. Display Controls Tests

### 5.1 Row Limiting
- [ ] Select ALL modules and start profiling
- [ ] Wait for stats to populate (100+ functions)
- [ ] Click "50" button → Verify only 50 rows shown
- [ ] Click "100" button → Verify only 100 rows shown
- [ ] Click "200" button → Verify only 200 rows shown
- [ ] Click "All" button → Verify all rows shown
- [ ] Summary text shows "(showing top X)" when limited

### 5.2 Minimal Mode
- [ ] Start profiling with multiple modules
- [ ] Check "Minimal mode" checkbox
- [ ] Verify stats table is hidden
- [ ] Verify "(Minimal mode - table hidden for performance)" message appears
- [ ] Verify FPS is noticeably higher (~50 vs ~22)
- [ ] Uncheck "Minimal mode" → Table returns

### 5.3 Column Visibility
- [ ] Start profiling
- [ ] Verify only 5 columns visible: Function, Calls, Avg, Max, Total
- [ ] Check "Show all columns"
- [ ] Verify 6 columns now visible (includes "Min" column)
- [ ] Uncheck → Min column hidden again

---

## 6. Preset Tests

### 6.1 Save Preset
- [ ] Select 5+ modules
- [ ] In Presets section, type name: `test_preset`
- [ ] Click "Save"
- [ ] Verify preset appears in preset list

### 6.2 Load Preset
- [ ] Click "Deselect All" in Module Browser
- [ ] Click on `test_preset` in preset list
- [ ] Verify the same 5+ modules are now selected

### 6.3 Delete Preset
- [ ] Click delete button (X) next to `test_preset`
- [ ] Verify preset is removed from list
- [ ] Re-save it for later tests

### 6.4 Preset Persistence
- [ ] Save a preset
- [ ] Quit game completely
- [ ] Restart game, load save
- [ ] Open Profiler → Verify preset still exists

---

## 7. Profile on Load Tests

### 7.1 Enable Auto-Profile
- [ ] Select modules to profile
- [ ] Check "Profile on Load" checkbox
- [ ] Verify `_AUTOLOAD_` preset is created/updated
- [ ] Quit game

### 7.2 Verify Auto-Start
- [ ] Start game
- [ ] Load save (or start new game)
- [ ] Open Profiler window
- [ ] Verify profiling is **already running** (button shows "Stop Profiling")
- [ ] Verify stats are being collected

### 7.3 Disable Auto-Profile
- [ ] Uncheck "Profile on Load"
- [ ] Quit and restart game
- [ ] Load save
- [ ] Open Profiler → Profiling should NOT be running

---

## 8. Flamegraph Tests

### 8.1 Recording
- [ ] Start profiling with several modules
- [ ] Expand "Flamegraph" section
- [ ] Click "Start Recording"
- [ ] Play game for 30+ seconds (do various actions)
- [ ] Click "Stop Recording"
- [ ] Verify "Samples: X" shows non-zero count

### 8.2 Export
- [ ] Click "Export Flamegraph"
- [ ] Check `appdata` folder for `.folded` file
- [ ] Open file in text editor → Verify format: `stack;frames count`
- [ ] File should have meaningful stack traces (not empty)

### 8.3 Callback Grouping
- [ ] Profile `axr_main` module
- [ ] Record flamegraph during game activity
- [ ] Export and examine `.folded` file
- [ ] Verify callbacks show specific names like:
  - `axr_main.make_callback/on_game_start`
  - `axr_main.make_callback/actor_on_update`
  - (Not just generic `axr_main.make_callback`)

### 8.4 Clear Recording

### 8.5 Export Button State (v1.1.2)
- [ ] Do NOT enable flamegraph collection
- [ ] Verify "Export Flamegraph" button is grayed out
- [ ] Verify "(enable collection first)" hint shows
- [ ] Enable "Collect Data" checkbox
- [ ] Start and stop profiling (collect some data)
- [ ] Disable "Collect Data" checkbox
- [ ] Verify "Export Flamegraph" button is STILL enabled (has data to export)
- [ ] Click Export → Verify it works
- [ ] After export, verify button becomes grayed out again (data cleared)
- [ ] Click "Clear" button
- [ ] Verify samples count resets to 0

---

## 9. CSV Export Tests

### 9.1 Export Stats
- [ ] Profile for 30+ seconds with stats accumulated
- [ ] Click "Export CSV"
- [ ] Check `appdata` folder for `.csv` file
- [ ] Open in Excel/text editor → Verify:
  - Header row with column names
  - Data rows with function stats
  - No corrupted characters

---

## 10. Logging Tests

### 10.1 Open Log Viewer
- [ ] Click **Logs** in DevTools menu
- [ ] Log viewer window opens
- [ ] Default logs visible (system messages)

### 10.2 Log Filtering
- [ ] Filter by severity (DEBUG, INFO, WARN, ERROR)
- [ ] Filter by category
- [ ] Clear filters → All logs visible

### 10.3 Manual Logging (Console)
- [ ] Open game console (`~` key)
- [ ] Execute: `devtools_logging.log("INFO", "TEST", "Hello World")`
- [ ] Verify message appears in log viewer

---

## 11. Manual Timer API Tests

### 11.1 Basic Timer (Console)
- [ ] Open game console
- [ ] Execute: `devtools_profiler.start_timer("test_section")`
- [ ] Wait 2 seconds
- [ ] Execute: `devtools_profiler.end_timer("test_section")`
- [ ] Execute: `devtools_profiler.get_stats("test_section")`
- [ ] Verify output shows ~2000ms total time

### 11.2 get_stats() Summary
- [ ] Profile several modules for 10 seconds
- [ ] Stop profiling
- [ ] Execute: `devtools_profiler.get_stats()`
- [ ] Verify summary prints (no crash, shows tracked function count)

---

## 12. Edge Case & Stability Tests

### 12.1 Many Modules
- [ ] Select 50+ modules
- [ ] Start profiling
- [ ] Play for 30 seconds
- [ ] No stack overflow errors
- [ ] Stop profiling cleanly

### 12.2 Rapid Start/Stop
- [ ] Click Start/Stop rapidly 10 times
- [ ] No crashes or stuck states

### 12.3 Level Transition
- [ ] Enable "Profile on Load"
- [ ] Travel to another level (via guide or walking)
- [ ] After load, verify profiling continues
- [ ] Stats reflect new level activity

### 12.4 Save/Load During Profile
- [ ] Start profiling
- [ ] Quicksave (F5)
- [ ] Continue profiling (no crash)
- [ ] Quickload (F9)
- [ ] Verify profiler state is consistent

---

## 13. Early Initialization Tests (Advanced)

### 13.1 Verify DLTX Loading
- [ ] Add `_g` and `axr_main` to preset
- [ ] Enable "Profile on Load"
- [ ] Restart game and load save
- [ ] Check exported flamegraph for:
  - `_g.start_game_callback` entries
  - `axr_main.on_game_start` entries
- [ ] These indicate early script capture is working