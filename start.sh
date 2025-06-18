#!/bin/bash

# Start Xvfb with the specified resolution
Xvfb :99 -screen 0 ${SCREEN_RESOLUTION} &
XVFB_PID=$!

# Wait for Xvfb to initialize
sleep 1

# Start Fluxbox window manager
fluxbox &
FLUXBOX_PID=$!

# Start x11vnc server
x11vnc -display :99 -forever -nopw -rfbport 5900 &
X11VNC_PID=$!

# Run the Python script
python3 /app/script.py

# Clean up (optional: terminate background processes)
kill $X11VNC_PID $FLUXBOX_PID $XVFB_PID 2>/dev/null
