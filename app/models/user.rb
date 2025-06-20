class User < ApplicationRecord
  has_many :tasks, dependent: :destroy, as: :taskable
  has_many :flights
  has_many :alerts
  has_many :votes


  has_one_attached :photo

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
