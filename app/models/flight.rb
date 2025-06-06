class Flight < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  has_many :alerts

  has_one_attached :photo

  enum :mobility_choice, [ :marche, :voiture, :transit, :vélo ]
end
