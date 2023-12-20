class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :posts
  validates :title, presence: true
end
