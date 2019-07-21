class CategoriesGame < ApplicationRecord
    belongs_to :game
    belongs_to :category

    #accepts_nested_attributes_for :category
end
