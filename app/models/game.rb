class Game < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :categories, through: :categoriesgames
    accepts_nested_attributes_for :categories

    validates :categories, presence: true
    validates :mechanisms, presence: true

end
