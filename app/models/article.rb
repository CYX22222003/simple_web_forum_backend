class Article < ApplicationRecord
  belongs_to :email
  has_many :comments
end
