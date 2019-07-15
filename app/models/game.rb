class Game < ApplicationRecord
    belongs_to :user
    has_many :categories
    has_many :mechanisms
end
