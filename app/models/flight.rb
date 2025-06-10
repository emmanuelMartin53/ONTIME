class Flight < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy, as: :taskable
  has_many :alerts, dependent: :destroy

  has_one_attached :photo

  validates :flight_number, presence: true
  validates :user_departure_address, presence: true
  validates :mobility_choice, presence: true

  enum :mobility_choice, [ :walking, :driving, :transit, :bicycling ]

  after_create :set_tasks
  MOBILITY_LABELS = {
    "walking" => "À pied",
    "driving" => "Voiture",
    "transit" => "Transports en commun",
    "bicycling" => "Vélo"
  }

  def mobility_choice_label
    MOBILITY_LABELS[mobility_choice]
  end

  private

  def set_tasks
    tasks = Task.where(taskable: self.user)
    tasks.each do |task|
      dup_task = task.dup
      dup_task.taskable = self
      dup_task.save
    end
  end
end
