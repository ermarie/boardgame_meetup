class Event < ApplicationRecord
    belongs_to :group
    has_many :users, through: :group

    #scope :within_1_day, => {where: date_time < (Date.today + 1)}

    def within_1_day
        Range.new(Date.today, Date.today + 1).include?(date_time.to_date)
    end

    def within_7_days
        Range.new(Date.today, Date.today + 7).include?(date_time.to_date)
    end

    def witin_30_days
        Range.new(Date.today, Date.today + 30).include?(date_time.to_date)
    end
end
