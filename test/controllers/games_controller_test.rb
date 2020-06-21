require 'test_helper'

class GamesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(pseudo: 'user', email:'user@gmail.com',
                 password:'password', password_confirmation: 'password',
                 admin: false)
  end

  test "should create a new game" do

  end

end
