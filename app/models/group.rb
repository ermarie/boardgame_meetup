class Group < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :events

    validates :name, presence: true, uniqueness: true, length: {minimum: 3}
end
