class Alert < ApplicationRecord
  belongs_to :flight

  scope :from_airport_and_date, ->(airport, date) {
  start_of_day = date.beginning_of_day
  end_of_day = date.end_of_day

  joins(:flight).where(flights: { airport: airport })
                .where(flights: { takeoff_time: start_of_day..end_of_day })
  }

end
