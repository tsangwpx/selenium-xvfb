FROM python:3.12

# Install dependencies
RUN apt-get update && apt-get install -y \
    xvfb \
    wget \
    unzip \
    chromium \
    chromium-driver

RUN apt-get update && apt-get install -y \
    xvfb \
    x11vnc \
    chromium \
    chromium-driver

RUN apt-get update && apt-get install -y \
    xvfb \
    fluxbox

# Install Python dependencies
RUN pip install selenium

# Set environment variables
ENV DISPLAY=:99
ENV SCREEN_RESOLUTION=1920x1080x24
ENV CHROME_USER_DATA_DIR=/tmp/chrome_user_data

# Create directories
RUN mkdir -p /app /tmp/chrome_user_data

# Copy your Selenium script
COPY script.py start.sh /app/
WORKDIR /app

# Run Xvfb and your script
# CMD ["sh", "-c", "Xvfb :99 -screen 0 1920x1080x24 & python script.py"]

# CMD ["sh", "-c", "Xvfb :99 -screen 0 1920x1080x24 & x11vnc -display :99 -bg -xkb -listen 0.0.0.0 -forever -nopw & python script.py"]

# Use the startup script as the entrypoint
CMD ["/app/start.sh"]
