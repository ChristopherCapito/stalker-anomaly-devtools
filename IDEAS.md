# DevTools Profiler - Feature Ideas

This document collects potential features and improvements for future releases.

**Philosophy:** Focus on exporting rich, structured data. Let external tools (Excel, Python, BI tools, Grafana) handle complex analysis and visualization. Keep the in-game tool lightweight and fast.

---

## Export Formats & Data Enrichment

### Enhanced CSV Export
**Priority: HIGH**
- Add columns:
  - `self_time_ms` - Time spent in function itself (exclude children)
  - `parent_function` - Name of calling function
  - `first_call_timestamp` - When function was first invoked
  - `last_call_timestamp` - When function was last invoked
  - `call_depth_avg` - Average call stack depth
  - `call_depth_max` - Maximum call stack depth
- Enables rich analysis in Excel/spreadsheets
- Minimal code changes (calculate during export)

### JSON/JSONL Export
**Priority: MEDIUM**
- Structured format easier to parse than CSV
- JSONL (JSON Lines) for streaming/appending
- Schema example:
  ```json
  {
    "function": "utils_ui.Update",
    "module": "utils_ui",
    "calls": 1000,
    "total_ms": 50.5,
    "self_ms": 30.2,
    "avg_ms": 0.05,
    "median_ms": 0.04,
    "min_ms": 0.01,
    "max_ms": 2.5,
    "parent": "axr_main.actor_on_update",
    "samples": [0.05, 0.04, 0.06, ...]
  }
  ```
- Import into Python/R/JavaScript for custom analysis

### SQLite Export
**Priority: MEDIUM**
- Export to `.db` file with schema:
  - `functions` table (aggregated stats)
  - `calls` table (individual invocations with timestamps)
  - `call_graph` table (caller → callee relationships)
- Query with SQL for complex analysis
- Example: `SELECT * FROM functions WHERE total_ms > 100 ORDER BY self_ms DESC`
- Time-series analysis: `SELECT timestamp, duration_ms FROM calls WHERE function = 'foo'`

### Live Streaming Output
**Priority: HIGH (Easy Win)**
- Write JSONL to file in real-time: `appdata/devtools_profiler_live.jsonl`
- Each function call appends one line: `{"ts": 123.456, "fn": "utils_ui.Update", "dur_ms": 2.5}`
- External tools tail the file (Python script, web dashboard, Grafana)
- Zero network overhead, just file I/O
- Optional: UDP socket for network streaming (low priority)

---

## Data Collection Improvements

### Self-Time Calculation
**Priority: HIGH**
- Separate function's own work from children
- Algorithm: `self_time = total_time - sum(children_time)`
- Track parent-child relationships during wrapping
- Export as additional column

### Caller Tracking
**Priority: MEDIUM**
- Store parent function name in call stack
- Minimal overhead (one string per call)
- Enables call graph export
- Export format: `function,parent,calls,total_ms`

### Individual Call Recording
**Priority: LOW**
- Optionally record every single invocation (not just aggregates)
- Schema: `timestamp, function, duration_ms, parent, call_depth`
- Toggle on/off (high overhead)
- Use case: Find specific slow calls, time-series analysis
- Export to SQLite or JSONL

### Call Stack Depth Tracking
**Priority: LOW**
- Track current depth, max depth, avg depth per function
- Identify recursion and deep callback chains
- Minimal overhead (increment counter)
- Export as columns in CSV

---

## In-Game UI Improvements

### Keep It Simple
- Current stats table is good
- Add "Self (ms)" column toggle
- Basic sorting and filtering
- Export buttons
- **Do NOT add:** Complex graphs, timelines, heatmaps (use external tools)

### Export Shortcuts
- Quick export buttons for common formats
- "Export for Excel" → CSV with all columns
- "Export for Python" → JSONL
- "Start Live Stream" → Begin appending to JSONL file

### Comprehensive Tooltips
- **Status: COMPLETED (v1.2.2)**
- Added tooltips for all UI controls to improve discoverability:
  - Start/Stop Profiling buttons
  - Reset Stats, Export CSV buttons
  - Timed profiling checkbox and duration input
  - Re-scan Now, Auto rewrap, and Interval controls
  - Flamegraph Collect Data and Export buttons
  - Profile on Load checkbox
  - Hide fast functions checkbox
  - Minimal mode checkbox
  - Max rows buttons (All/50/100/200)
  - Column visibility checkboxes (Calls/Avg/Median/Min/Max/Total)
- Tooltips use `ImGui.BeginItemTooltip()` with wrapped text for readability
- Each tooltip explains what the control does, when to use it, and any performance implications

---

## External Tool Integration

### Example Workflows

**Excel Analysis:**
- Export CSV with self-time, caller, timestamps
- Pivot tables, charts, conditional formatting
- Compare before/after optimization

**Python/Jupyter:**
- Import JSONL or SQLite
- Pandas DataFrames for analysis
- Matplotlib/Plotly for visualization
- Statistical tests, trend detection

**Grafana Dashboard:**
- Tail live JSONL file
- Real-time performance monitoring
- Alert on thresholds
- Second monitor showing live stats

**Custom Web Dashboard:**
- Simple HTTP server reading JSONL
- WebSocket push to browser
- D3.js/Chart.js visualization
- Call graph rendering

---

## Advanced Ideas (Low Priority)

### Parquet Export
- Columnar format, excellent compression
- Standard in data engineering
- Fast to read in Python/Pandas
- Overkill for most users

### Call Graph Export (DOT/GraphML)
- Export caller → callee relationships as graph file
- Visualize with Graphviz, yEd, Gephi
- Understand module dependencies

### Diff Two Sessions
- Export two profiling sessions
- External script compares them
- Highlight regressions/improvements
- Could be built into tool, but better as external script

### Memory Profiling
- If engine exposes Lua memory tracking
- Correlate allocations with function calls
- Export memory stats alongside timing

---

## Implementation Priority

### Phase 1 (v1.3.0)
1. Enhanced CSV export (self-time, caller, timestamps)
2. Live JSONL streaming to file
3. Self-time calculation

### Phase 2 (v1.4.0)
1. JSON/JSONL export option
2. Caller tracking in call stack
3. SQLite export

### Phase 3 (Future)
1. Individual call recording (optional, high overhead)
2. Call graph export (DOT format)
3. Advanced external tool integration examples

---

## Community Requests

(Add user-requested features here as they come in)

---

**Note:** This is a living document. Add ideas freely. Before implementing, discuss scope/priority.