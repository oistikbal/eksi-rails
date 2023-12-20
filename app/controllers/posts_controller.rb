class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def edit
  end

  def create
    @post = Post.create(post_post_params)
    @post.user = current_user

    if @post.save
      redirect_to topic_path(@post.topic), notice: "Post Successfully created"
    else
      redirect_to topic_path(@post.topic), notice: "Post failed to created"
    end
  end

  private
  def post_post_params
    params.require(:post).permit(:body, :topic_id)
  end
end
