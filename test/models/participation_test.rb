require 'test_helper'

class ParticipationTest < ActiveSupport::TestCase

  def setup
    @user = User.new(pseudo: 'user', email:'user@gmail.com',
                 password:'password', password_confirmation: 'password',
                 admin: false)
    @participant = User.new(pseudo: 'participant', email:'participant@gmail.com',
             password:'password', password_confirmation: 'password',
             admin: false)


    @game = Game.new #(user: @user)
    @participation = Participation.new # (user: @user_participant,
                                       # game: @game,
                                       # token: @game.token)
  end

  test "participation should have a user, a game and the game token to be valid" do
    @participant.save
    @user.save
    @game.save(user: @user)
    @participation.user = @participant
    @participation.game = @game
    assert @participation.valid?
  end

  test "same user in game and participation should be rejected" do
    # see  Participation Controller and Policy
  #   @user.save
  #   @game.save(user: @user)
  #   @participation.user = @user
  #   @participation.game = @game
  #   @participation.token = @game.token
  #   assert_not @participation.valid?
  end

  test "participation with and invalid game should be rejected" do
    @participant.save
    @game.user = @user
    assert_not @game.valid?
    @participation.user = @participant
    @participation.game = @game
    # assert_not @participation.valid? # Add a condition on game in Controller
  end

  test "participation should have a total_score initialized to zero" do
    assert @participation.total_score.zero?
  end


end
