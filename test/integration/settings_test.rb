require "test_helper"

class SettingsTest < ActionDispatch::IntegrationTest
  test "user settings nav" do
    sign_in_as users(:one)
    get settings_profile_path
    assert_dom "h4", "Account Settings"
    assert_not_dom "a", "Store Settings"
  end

  test "admin settings nav" do
    sign_in_as users(:admin)
    get settings_profile_path
    assert_dom "h4", "Account Settings"
    assert_dom "h4", "Store Settings"
  end
end
