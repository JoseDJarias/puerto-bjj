require "application_system_test_case"

class ScreenshotsTest < ApplicationSystemTestCase
  VIEWPORTS = { desktop: [ 1440, 900 ], mobile: [ 390, 844 ] }.freeze
  PAGES = { home: "/", programs: "/programs", program: "/program/kids", about: "/about-us" }.freeze

  VIEWPORTS.each do |viewport, (width, height)|
    PAGES.each do |name, path|
      test "capture #{name} on #{viewport}" do
        page.driver.browser.manage.window.resize_to(width, height)
        visit path
        assert_selector "h1"
        full_height = page.evaluate_script("document.documentElement.scrollHeight")
        page.driver.browser.manage.window.resize_to(width, full_height)
        sleep 0.4
        page.save_screenshot(Rails.root.join("tmp/screenshots/#{name}_#{viewport}.png"))
      end
    end
  end
end
