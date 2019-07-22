class Event < ApplicationRecord
    has_and_belongs_to_many :users

    validates :name, presence: true, uniqueness: true, length: {minimum: 3}

end
