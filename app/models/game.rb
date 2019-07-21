class Game < ApplicationRecord
    has_many :plays
    has_many :users, through: :plays
    has_many :categories_games
    has_many :categories, through: :categories_games
    accepts_nested_attributes_for :categories

    validates :name, presence: true
    validates :categories, presence: true

    scope :kid_friendly, -> {where("min_age < ?", "10")}

end
