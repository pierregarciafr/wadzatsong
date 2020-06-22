require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers

  def setup
    @user = users(:michel)
  end

  test "should create a new game" do
    get games_path
    assert_redirected_to edit_games_path
  end

  test "should begin " do
  end

end
