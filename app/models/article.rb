class Article < ApplicationRecord
  belongs_to :email
  belongs_to :tag
  has_many :comments
end
