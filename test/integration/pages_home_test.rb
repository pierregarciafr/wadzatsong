require 'test_helper'

class PagesHomeTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
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

  test 'should display links if user not logged in clicks anywhere' do
    get root_path
    assert_template 'pages/home'
    # assert_not user_signed_in?
  end

  test 'should allow create game if user logged in' do
    sign_in(@user)
    assert_difference 'Game.count', +1 do
      post games_path, params: { game: { user: @user }}
    end
  end

  test 'if user logged in should display 2 buttons and icon with 2 links' do

    sign_in @user
    assert is_logged_in?
    get root_path
    assert_template 'pages/home'

    # verifier que les liens sont affiches :

    assert_select "a[href=?]", new_participation_path
    # assert_select "a[href=?]", games_path # ne marche pas

    # - lien vers le game
    # lien vers les participations
    # lien à cliquer
  end

end
