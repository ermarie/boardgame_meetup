class Event < ApplicationRecord
    belongs_to :group
    has_many :users, through: :group

    scope :within_1_day, -> {where("date_time < ? and date_time > ?", Date.today + 2, Date.today)}
    scope :within_7_days, -> {where("date_time < ? and date_time > ?", Date.today + 8, Date.today)}
    scope :within_30_days, -> {where("date_time < ? and date_time > ?", Date.today + 31, Date.today)}

end
