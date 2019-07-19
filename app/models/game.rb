class Game < ApplicationRecord
    has_many :game_users
    has_many :users, through: :game_users
    has_many :category_games
    has_many :categories, through: :category_games
    accepts_nested_attributes_for :category_games, :categories

    validates :categories, presence: true

end
