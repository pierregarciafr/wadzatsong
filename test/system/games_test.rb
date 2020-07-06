require "application_system_test_case"

class GamesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  self.use_instantiated_fixtures = true   # for l 24 to work

  test "launching the game" do
    visit root_path
    assert_selector "h1", text: "GUESS WHAT"
  end

  test "sign in the game" do
    visit root_path
    # click_on_selector "id", "homepage"
    # sign_in @michel
    # assert_selector "h1", text: "GUESS WHAT"
  end

end
