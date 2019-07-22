class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :minutes_played, presence: true
  validates :winner, presence: true

end
