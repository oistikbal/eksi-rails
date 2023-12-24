class PostSerializer
  include JSONAPI::Serializer
  include Pagy::Backend

  attributes :body
  belongs_to :topic
  attribute :user_mail do |post|
    "#{post.user.email}"
  end
end
