require 'test_helper'

class PagesHomeTest < ActionDispatch::IntegrationTest

  # create fixtures .yml
  def setup
    @user = users(:michel)
  end

  test 'should abort create game if user not logged in' do
    assert_no_difference 'Game.count' do
      post games_path, params: { game: { token: '123456' }}
    end
    assert_redirected_to new_user_session_path
  end

  test 'should allow create game if user logged in' do
    log_in_as(@user)
    assert_difference 'Game.count', +1 do
      post games_path, params: { game: { token: '123456', user: @user }}
    end

  end

end
