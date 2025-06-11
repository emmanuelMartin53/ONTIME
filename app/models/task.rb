class Task < ApplicationRecord
  attr_accessor :add_to_user_list
  belongs_to :taskable, polymorphic: true
  belongs_to :category

  validates :content, :category, presence: true

   scope :admin, ->() {
    where(category: Category.find_by(name: "Administratif"))
  }
   scope :valise, ->() {
    where(category: Category.find_by(name: "Ma valise"))
  }
   scope :partir, ->() {
    where(category: Category.find_by(name: "Avant de partir"))
  }

  def self.progressLength(flight, category)
    tasks_in_category = flight.tasks.where(category: category)
    total = tasks_in_category.count
    done = tasks_in_category.where(done: true).count
    return 0 if total == 0
    (done * 100) / total
  end


end
