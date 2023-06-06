class Game < ApplicationRecord
  belongs_to :user
  belongs_to :game_type
  has_many :participations

  validates :location, presence: true
  validates :start_at, presence: true
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :number_of_players, presence: true, numericality: { only_integer: true }, comparison: { greater_than: 0, less_than_or_equal_to: 5 }
  validates :competitive, presence: true, inclusion: [true, false], exclusion: [nil]
end
