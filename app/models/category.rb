class Category < ApplicationRecord
    has_many :category_games
    has_many :games, through: :category_games

    validates :name, presence: true
end
