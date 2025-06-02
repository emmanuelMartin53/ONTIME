class Task < ApplicationRecord
  belongs_to :user
  belongs_to :flight, optional: true
end
