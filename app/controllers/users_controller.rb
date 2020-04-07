class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @faster_answer = Answer.where(status:true).order(answering_time: :ASC).first
    @user_faster_answer = @user.answers.where(status:true).order(answering_time: :ASC).first
    @percent_user_good_answers = get_total_percent(@user)
    @french_percent = get_playlist_percent(@user, "French")
    @rock_percent = get_playlist_percent(@user, "Rock")
    @disco_percent = get_playlist_percent(@user, "Disco")
    @pop_percent = get_playlist_percent(@user, "Pop")
    @rnb_percent = get_playlist_percent(@user, "R-N-B")
    @electro_percent = get_playlist_percent(@user, "Electro")
    @user_hight_score = get_highscore(@user)
  end

  private

  def total_tracks(user)
    (user.games.count + user.participations.count) * Game::NUMBER_OF_ROUNDS
  end

  def get_total_percent(user)
    if user.games.count != 0
      (user.answers.where(status: true).count * 100) / total_tracks(user)
    end
  end

  def get_playlist_percent(user, playlist)
    playlist_theme_array = []
    Playlist.where(name:playlist).each do |playlist|
      playlist_theme_array << playlist.id
    end

    count_games = 0
    total_user_good_answers = 0

    user.games.each do |game|
      if playlist_theme_array.include?(game.playlist_id)
        count_games += 1
        good_answers = game.answers.where("status = ? AND user_id = ?", true, @user.id).count
        total_user_good_answers += good_answers
      end
    end

    user.participations.each do |participation|
      if playlist_theme_array.include?(participation.game.playlist_id)
        count_games += 1
        good_answers = participation.game.answers.where("status = ? AND user_id = ?", true, @user.id).count
        total_user_good_answers += good_answers
      end
    end
    if (count_games * Game::NUMBER_OF_ROUNDS) != 0
      result = (total_user_good_answers * 100) / (count_games * Game::NUMBER_OF_ROUNDS)
    else
    result = "-"
    end
    return result
  end

  def get_highscore(user)
    highscore = []
    if user.games.count != 0
      highscore << user.games.order(total_score: :desc).first.total_score
    end
    if user.participations.count !=0
      highscore << user.participations.order(total_score: :desc).first.total_score
    end
    highscore.sort.last
  end
end
