class TopicSerializer
  include JSONAPI::Serializer

  attributes :title
  has_many :posts
  has_many :posts
end
