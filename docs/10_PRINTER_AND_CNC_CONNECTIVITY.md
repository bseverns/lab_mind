# Printer and CNC Connectivity

## Printer side
- Sketch / Sketch+ / Method X remain Digital Factory-native
- do not assume OctoPrint is the universal answer here
- built-in printer cameras reduce the need for extra bridge hardware

## CNC side
- Cubiko is the local machine that may attach to Jetson-A
- if physically close, connect via USB and use `cncjs`
- if not physically close, do not force the layout

## One-screen principle
The unified control room is:
- one browser
- one set of pinned tabs
- one private Jetson operator surface
- one Digital Factory tab for printers
- one CNCjs tab only if the Cubiko is local
