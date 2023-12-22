class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_post, only: [:show, :edit]

  def edit
  end

  def show
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

  def set_post
    begin
      @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end
end
