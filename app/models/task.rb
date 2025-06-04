class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :flight, optional: true
end
