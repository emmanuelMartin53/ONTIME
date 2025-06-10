class Task < ApplicationRecord
  attr_accessor :add_to_user_list
  belongs_to :taskable, polymorphic: true
  belongs_to :category
end
