class Event < ApplicationRecord
    belongs_to :group
    has_many :users, through: :group

    validates :name, presence: true, uniqueness: true, length: {minimum: 3}

end
