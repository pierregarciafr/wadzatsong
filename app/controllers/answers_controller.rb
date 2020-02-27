class AnswersController < ApplicationController
  def create
    @track = Track.find(params[:answer][:track])
    @game = Game.find(params[:game_id])
    @answer = Answer.new(params_answer)
    @answer.game = @game
    @answer.user = current_user
    @answer.track = @track
    @answer.save # remplacer par answersave = @answer.save
    @tracks = @game.playlist.tracks
      if (@answer.content.downcase == @track.title.downcase) || (@answer.content.downcase == @track.artist.downcase)
        @answer.status = true
        @answer.save
      else
        @answer.status = false
        @answer.save
      end
    @game.running!

    # chatroom ----

    # if @answer.save     # if answersave
    #   GameChannel.broadcast_to(@game, render_to_string(partial: 'message', locals: { message: @message}))
    #   redirect_to game_path(@game)
    # else
    #   render "games/show"
    # end

    # ----- fin chatroom

    redirect_to game_path(@game)
    authorize @game

  end


def score(answer)
  score = 0
  if answer.answering_time < 3
  score = 1000
  elsif answer.answering_time < 5
  score = 200
  elsif answer.answering_time < 10
  score = 50
  else
  score = 10
end


  private

  def params_answer
    params.require(:answer).permit(:content, :answering_time)
  end
end
