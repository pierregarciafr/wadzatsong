class AnswersController < ApplicationController
  def create
    @track = Track.find(params[:answer][:track])
    @game = Game.find(params[:game_id])
    # @participation = Participation.find_by game_id:@game.id
    @answer = Answer.new(params_answer)
    @ghost = User.first
    @answer.game = @game
    if @answer.answering_time.nil?
      @answer.user = User.first
    else
      @answer.user = current_user
    end
    @answer.track = @track
    @answer.save
    @tracks = @game.playlist.tracks
    @user = current_user
    @playlist = @game.playlist
    check_answer(@answer, @track)
    # @game.total_score = get_total_game(@game)
    # if @participation
    #   @participation.total_score = get_total_participation(@game)
    # end
    # @participation.save


    if @answer.save
      @game.running!
      # l'id de la premiere des tracks qui n'a pas encore été jouée
      @current_track = @game.playlist.tracks.where.not(id: @game.answers.where(status: true).pluck(:track_id)).first
      if @current_track
      GameChannel.broadcast_to(
      @game,
      status: 'running',
      content: render_to_string(
        partial: "games/game_running",
        locals: {
          answering_time: @answering_time,
          current_track: @current_track,
          game: @game
        }),
      navbar: render_to_string(
        partial: "games/navbar",
        locals: {
            user: @user,
            game_participants: @game_participants,
            playlist: @playlist
        })
      )
        redirect_to game_path(@game)
        # <%= link_to running_game_path(@game), method: :patch do %>
      else
        @game.finished!
        GameChannel.broadcast_to(
        @game,
        status: 'finished',
        content: render_to_string(
          partial: "games/game_finished",
          locals: {
            user: @user,
            answering_time: @answering_time,
            current_track: @current_track,
            game: @game
          })
        )
        redirect_to game_path(@game)
      end

    else
      render "games/show"
    end

    # redirect_to game_path(@game)
    authorize @game

  end

  private

  def check_answer(answer, track)
    answer.status = (String::Similarity.cosine @answer.content.downcase, @track.title.downcase) >= 0.75 || (String::Similarity.cosine @answer.content.downcase, @track.artist.downcase) >= 0.75
    # pas de reponse => status = true (et pas compris pourquoi)
    answer.score = answer_scoring(answer)
  end

  def params_answer
    params.require(:answer).permit(:content, :answering_time)
  end

  def answer_scoring(answer)

    case answer.status
    when true
      return 0 if answer.answering_time.nil? # cas si aucune réponse n'est donnée.

      if answer.answering_time < 2
        return 500
      elsif answer.answering_time < 5
        return 350
      elsif answer.answering_time < 8
        return 175
      elsif answer.answering_time < 11
        return 70
      elsif answer.answering_time < 15
        return 35
      else
        return 10
      end
    when false
      return 0
    else
      return 0
    end
  end

  # def get_total_game(game)
  #   mj_game_good = game.user.answers.where("status = ? AND game_id = ?", true, game.id)
  #   total_score = 0
  #   mj_game_good.each do |answer|
  #     total_score += answer.score
  #   end
  #   return total_score
  # end

  # def get_total_participation(game)
  #   player2_game_good = game.participants[0].answers.where("status = ? AND game_id = ?", true, @game.id)
  #   total_score = 0
  #   player2_game_good.each do |answer|
  #     total_score += answer.score
  #   end
  #   return total_score
  # end

end
