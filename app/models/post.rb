class Post < ApplicationRecord
  belongs_to :topic, :user
end
