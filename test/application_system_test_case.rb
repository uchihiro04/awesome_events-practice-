require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  Capybara.default_max_wait_time = 10
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  include SignInHelper
end
