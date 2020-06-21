require 'test_helper'

class GameTest < ActiveSupport::TestCase

  def setup
    @user = User.new(pseudo: 'test', email:'test@gmail.com',
                 password:'password', password_confirmation: 'password',
                 admin: false)
    @game = Game.new

  end

  test "game should have a token" do
    @game.save
    assert @game.token
  end

  test "should reject game without a token" do
    @game.token = nil
    assert_not @game.valid?
  end

  test "game should get a user" do
    @game.user = @user
    assert @game.user
  end

  test "game should reject a non valid user" do
    @game.user = @user
    assert_not @game.valid?
  end

  test "game should validate if user is valid" do
    @user.save
    @game.user = @user
    assert @game.valid?
  end

  test "should reject a game without user" do
    assert_not @game.valid?
  end

  test "should have a score for user" do
    assert @game.total_score
  end

  test "should not record game without user" do
    assert_difference 'Game.count', 0 do
      @game.save
    end
  end

  test "game should record in db when has user" do
    @user.save
    @game.user = @user
    assert @game.valid?
    assert_difference 'Game.count', +1 do
      @game.save
    end
  end

  test "shouldn't destroy games when destroying user" do
    @user.save
    @game.save(user: @user)
    assert_difference 'Game.count', 0 do
      @user.destroy
    end
  end

  test "token must be unique" do
    array_of_tokens = []
    1000.times do
      game = Game.new(user: @user)
      game.save
      array_of_tokens << game.token
    end
    assert array_of_tokens.uniq.count == array_of_tokens.count
  end

end
