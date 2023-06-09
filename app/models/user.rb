class User < ApplicationRecord
  belongs_to :game_type
  has_many :games, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :games_as_participant, through: :participations, source: :game
  has_many :chatrooms, through: :games_as_participant
  has_many :reviews, dependent: :destroy
  has_many :reviews_as_participant, through: :participations, source: :reviews
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  # before_save :attach_photo

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # LINES COMMENTED BECAUSE NOT ASKED IN THE SIGNUP PAGE
  # validates :username, presence: true, uniqueness: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def attach_photo
    return if photo.attached?

    self.photo.attach(io: File.open(File.join(Rails.root, 'app/assets/images/default_avatar.jpg')), filename: 'avatar')
  end

  def mygames
    self.games_as_participant
  end

  def games_not_participating_and_to_come
    Game.not_participating_games_to_come_for(self)
  end

  def average_level
    total = participations.where.not(level: nil).sum(:level)
    total.fdiv(participations.where.not(level: nil).count).round(1)
  end

  def current_level(participations = self.participations.where.not(level: nil).joins(:game).where(games: { competitive: true }).where("games.start_at < ?", Time.now + 7_200).order("games.start_at ASC"))
    participations.reduce(2) do |sum, p|
      sum += p.level.fdiv(30)
    end.round(1)
  end

  def past_games_with_score
    Game.joins(participations: :user)
        .where.not(participations: { score: nil })
        .where(users: { id: self.id })
        .where("games.start_at <= ?", Time.now.in_time_zone)
        .order("games.start_at ASC")
  end

  def past_competitive_games_with_score
    past_games_with_score.where(competitive: true)
  end

  def victories_number
    past_games_with_score.count { |g| g.winner == self  }
  end

  def competitive_victories_number
    past_competitive_games_with_score.count { |g| g.winner == self  }
  end

  def level_history_data
    past_competitive_games_with_score.includes(:participations).map do |game|
      date = game.start_at
      previous_games = past_competitive_games_with_score.where("start_at <= ?", date)
      # level_at_the_time = previous_games.map { |g| g.participations.find_by(user_id: self.id) }.reduce(2) do |sum, p|
      level_at_the_time = current_level(participations.where(game: previous_games))
      [date, level_at_the_time]
    end.to_h
  end

  def level_history_data_2
    past_competitive_games_with_score.map do |game|
      date = game.start_at
      previous_games = games.where("start_at < ?", date)
      # level_at_the_time = previous_games.map { |g| g.participations.find_by(user_id: self.id) }.reduce(2) do |sum, p|
      level_at_the_time = participations.where(game: previous_games).sum("participations.level / 30")
      [date, level_at_the_time]
    end.to_h
  end
end
