require 'test_helper'

class GameTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true   # for instanciation fo work @game1

  def setup
    @user = User.new(pseudo: 'test', email:'test@gmail.com',
                 password:'password', password_confirmation: 'password',
                 admin: false)
    @game = Game.new
  end


  test "should count 2 game fixtures" do
    assert_equal 2, Game.count
  end

  test "should get expected game fixture token" do
    @game1.save
    assert_equal '123456', @game1.token
    assert_equal 'ABCDEF', @game2.token
  end

  test "should get expected game fixture user" do
    assert_equal 'michelchardou', @game1.user.pseudo
    assert_equal 'ladygaga', @game2.user.pseudo
  end

  test "should get expected game fixture total_score" do
    assert_equal 0, games(:game1).total_score
  end



  test "should accept game without a token" do
    @game1.token = nil
    assert @game1.valid?
  end

  test "token must be unique on a wide sample" do
    array_of_tokens = []
    1000.times do
      game = Game.new(user: @user)
      game.save
      array_of_tokens << game.token
    end
    assert_equal array_of_tokens.count, array_of_tokens.uniq.count
  end

  test "new instance of Game should initialize with a score" do
    assert_equal 0, @game.total_score
  end

  test "game should not be valid without user" do
    assert_nil @game.user
    assert_not @game.valid?
    assert_not @game.save
  end

  test "model should reject a game without user" do
    assert_difference 'Game.count', 0 do
      @game.save
    end
  end

  test "game should not be valid when has unrecorded user" do
    @game.user = @user
    assert_not @game.valid?
  end


  test "game should be valid when has recorded user" do
    @game.user = @michel
    assert @game.valid?
  end

  test "game should save when game.user is a record" do
    @user.save
    @game.user = @user
    assert @game.save
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

end
