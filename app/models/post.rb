class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :topic,required: true
  belongs_to :user, required: true
end
