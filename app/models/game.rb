class Game < ApplicationRecord
    has_and_belongs_to_many :users
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :mechanisms
    accepts_nested_attributes_for :categories, :mechanisms

    validates :categories, presence: true
    validates :mechanisms, presence: true

end
