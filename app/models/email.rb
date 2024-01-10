class Email < ApplicationRecord
  has_many :users
  has_many :articles
  has_many :comments
  validates :address, presence: true, uniqueness: true
end
