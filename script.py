from selenium import webdriver
from selenium.webdriver.chrome.options import Options

# Configure Chrome options
chrome_options = Options()
chrome_options.add_argument("--no-sandbox")
chrome_options.add_argument("--disable-dev-shm-usage")
chrome_options.add_argument("--disable-blink-features=AutomationControlled")
# chrome_options.add_argument("--headless")  # Optional: Selenium can run headless

# Initialize the driver
driver = webdriver.Chrome(options=chrome_options)

try:
    # Navigate to a page
    driver.get("https://example.com")
    
    # Capture screenshot for debugging
    driver.save_screenshot("screenshot.png")
    print("Screenshot saved as screenshot.png")
    
    # Example: Get page title
    print("Page title:", driver.title)

    import time
    time.sleep(3600)

finally:
    # Clean up
    driver.quit()
