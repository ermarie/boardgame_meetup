class Game < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :categories
    has_many :mechanisms
end
