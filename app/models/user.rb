class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games
  has_many :participations
  has_many :answers

  def test(param)
    return param.nil? || param.zero? ? '-' : param
  end

  def highest_score
    highestscore = []
    if games.count != 0
      highestscore << games.order(total_score: :desc).first.total_score
    end
    if participations.count !=0
      highestscore << participations.order(total_score: :desc).first.total_score
    end
    highestscore.sort.last ? highestscore.sort.last : '-'
  end

  def played_tracks
    (games.count + participations.count) * Game::NUMBER_OF_ROUNDS
  end

  def good_answers_percentage
    # return '-' if games.count == 0 && participations.count == 0
    played_tracks != 0 ? (answers.where(status: true).count * 100) / played_tracks : '-'
  end

  def best_chrono
    right_answers = answers.where(status:true).order(answering_time: :ASC).first
    right_answers ? right_answers.answering_time : '-'
  end

  def percentages
    get_playlist_percent("French")
    # { french_percent: get_playlist_percent("French"),
    #   rock_percent: get_playlist_percent("Rock"),
    #   dance_percent: get_playlist_percent("Dance"),
    #   pop_percent: get_playlist_percent("Pop"),
    #   rnb_percent: get_playlist_percent("R-N-B"),
    #   electro_percent: get_playlist_percent("Electro")
    # }
  end

  private

  def get_playlist_percent(genre)

    # 21 06 20
    # nombre total de tracks jouées pour un genre donné

    # total_good_answers(user) = Answer.where(user_id:user.id)
                                     # .where(status:true)
                                     # .joins(track: :playlist).count
# Answer.where(user_id:user.id).where(status:true).joins(track: :playlist).count
# Track.find_by_sql('SELECT * FROM tracks t JOIN answers a ON a.id = t.answer_id JOIN playlist p ON p.id = t.playlist_id WHERE a.status = true AND p.name = ?', 'French');

    # total_tracks(genre) = Playlist.where(name: genre).joins(:tracks).count


    # good_answers_per_genre = Playlist.where(name:genre).joins(tracks: :answers).where(answers:{status: true,user_id: self}).count
    # good_answers_per_genre = Track.joins(:answers).where(answers:{status: true, user_id: self}).joins(:playlist).where(playlist:{name: genre})
    #good_answers_per_genre = Answer.joins(:track, :playlist).where(answers:{status: true, user_id: self},playlist:{name: genre})
    'NR'

    # tracks_per_genre = Playlist.where(name:genre).joins(:tracks).count
    # (good_answers_per_genre.fdiv(tracks_per_genre)).round



    # count_games = 0
    # total_user_good_answers = 0

    # user.games.each do |game|
    #   if playlist_theme_array.include?(game.playlist_id)
    #     count_games += 1
    #     good_answers = game.answers.where("status = ? AND user_id = ?", true, @user.id).count
    #     total_user_good_answers += good_answers
    #   end
    # end

    # user.participations.each do |participation|
    #   if playlist_theme_array.include?(participation.game.playlist_id)
    #     count_games += 1
    #     good_answers = participation.game.answers.where("status = ? AND user_id = ?", true, @user.id).count
    #     total_user_good_answers += good_answers
    #   end
    # end
    # if (count_games * Game::NUMBER_OF_ROUNDS) != 0
    #   result = (total_user_good_answers * 100) / (count_games * Game::NUMBER_OF_ROUNDS)
    # else
    # result = "-"
    # end
    # return result
  end


end
