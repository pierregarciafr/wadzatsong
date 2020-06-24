require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:michel)
    @other_user = users(:lady)
    @game1 = games(:game1)
    @game2 = games(:game2)
  end

  test "should not get new participation if no user logged" do
    get root_path
    get new_participation_path
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_template 'devise/sessions/new'
  end

  test "should get new participation if user logged" do
    get root_path
    sign_in @user
    get new_participation_path
    assert_response :success
    # assert_redirected_to new_participation_path
    assert_template 'participations/new'
  end

  # test "should create participation if token null or random" do
  #   get new_participation_path

  # end

  test "game should have token" do
    assert @game1.token
  end

  test "should create participation if token" do
    sign_in @user
    get new_participation_path
    assert_difference 'Participation.count', +1 do
      post participations_path, params: { participation: { user: @user, game: @game1, token: '123456', total_score: 0 }}, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }
    end
  end

end
