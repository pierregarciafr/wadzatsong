require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  self.use_instantiated_fixtures = true

  def setup

  end

  # test "should get create" do
  #   assert :user_signed_in?
  #   post (:create, { user: @michel })
  # end

  test "should get create if user connected" do
    sign_in @michel
    assert_difference 'Game.count', 1 do
      post games_path, params:{ user: @michel }
    end
  end

  test "should get not create if user not connected" do

    assert :user_signed_in?
    sign_in @michel
    assert_no_difference 'Game.count' do # should return 0
      post games_path, params:{ user: @lady }
    end
  end

  # test "should get edit" do
  #   sign_in @michel
  #   get edit_game_path(@game1)
  #   assert_response :success
  # end

  # test "should get update" do
  #   sign_in @michel
  #   assert_difference 'Game.count', 1 do
  #     patch game_path(@game1), params:{ status: 'created', playlist: @french }
  #   end
  # end


  # test "should get show" do
  #   sign_in @michel
  #   get game_path(@game1)
  #   assert_response :success
  # end

  test "should get created" do
  end

  test "should get running" do
  end

  test "should get paused" do
  end

# test "should redirect edit when not logged in" do
#     get edit_user_path(@user)
#     assert_not flash.empty?
#     assert_redirected_to login_url
# end


  test "homepage should not create a new game if no user logged" do
    get root_path
    assert_no_difference 'Game.count' do
      post games_path, params: { games: { user: @user }}
    end
  end

  test "homepage should create a new game for the user logged" do
    get root_path
    sign_in @michel
    assert is_logged_in?
    assert_difference 'Game.count', +1 do
      post games_path, params: { games: { user: @michel }}
    end
  end

  # test "homepage should not create a new game with another user than the logged user" do
  #   get root_path
  #   sign_in @user
  #   assert_no_difference 'Game.count' do
  #     post games_path, params: { games: { user: @other_user }}
  #   end
  # end

  # test "access to game edit view" do
  #   sign_in @user
  #   get edit_game_path(@game_1)
  #   assert_response :success
  # end
end
