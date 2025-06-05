class Alert < ApplicationRecord
  belongs_to :flight
  belongs_to :user
  has_many :votes

  scope :from_airport_and_date, ->(airport, date) {
  start_of_day = date.beginning_of_day
  end_of_day = date.end_of_day

  joins(:flight).where(flights: { airport: airport })
                .where(flights: { takeoff_time: start_of_day..end_of_day })
  }

end
