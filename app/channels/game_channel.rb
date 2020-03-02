class GameChannel < ApplicationCable::Channel
  def subscribed
    # Called when the consumer has successfully
    # become a subscriber to this channel.

    game = Game.find(params[:id])
    stream_for game
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
