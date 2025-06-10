class Flight < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :alerts

  has_one_attached :photo

  validates :flight_number, presence: true
  validates :user_departure_address, presence: true
  validates :mobility_choice, presence: true

  enum :mobility_choice, [ :walking, :driving, :transit, :bicycling ]

  MOBILITY_LABELS = {
    "walking" => "À pied",
    "driving" => "Voiture",
    "transit" => "Transports en commun",
    "bicycling" => "Vélo"
  }

  def mobility_choice_label
    MOBILITY_LABELS[mobility_choice]
  end
end
