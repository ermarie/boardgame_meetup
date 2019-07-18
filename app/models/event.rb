class Event < ApplicationRecord
    belongs_to :group
    has_many :users, through: :group

    scope :within_1_day, -> {where("date_time.to_date < ?", Date.today + 2)}
    scope :within_7_days, -> {where("date_time.to_date < ?", Date.today + 8)}
    scope :within_30_days, -> {where("date_time.to_date < ?", Date.today + 31)}

end
