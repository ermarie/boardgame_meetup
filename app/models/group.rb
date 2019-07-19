class Group < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :events
end
