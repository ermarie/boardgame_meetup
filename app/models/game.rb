class Game < ApplicationRecord
    has_many :users
    has_many :categories, through: :categories_games
    accepts_nested_attributes_for :categories

    validates :categories, presence: true

end
