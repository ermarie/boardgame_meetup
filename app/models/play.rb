class Play < ApplicationRecord
  belongs_to :game
  belongs_to :user

  scope :ties, -> {where("winner = ?", "tie")}

end
