class Flight < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  enum :mobility_choice, [ :walking, :driving, :transit, :bicycling ]
end
