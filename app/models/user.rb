class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
end
