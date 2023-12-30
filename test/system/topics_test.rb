require "application_system_test_case"

class TopicsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "a", text: "EksiRails"
  end
end
