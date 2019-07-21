class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :minutes_played, presence: true

  scope :ties, -> {where("winner = ?", "tie:")}

end
