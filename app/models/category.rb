class Category < ApplicationRecord
    has_many :categories_game
    has_many :games, through: :categories_game

    validates :name, presence: true 
end
