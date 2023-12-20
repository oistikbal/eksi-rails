class TopicsController < ApplicationController
  before_action :set_topic, only: :show
  before_action :authenticate_user!, only: [:new, :create]

  def show
  end

  def new
    @topic = Topic.new
    @topic.posts.new
  end

  def create
    @topic = Topic.new(topics_post_params)
    @topic.posts.each do |post|
      post.user = current_user
    end
    if @topic.save
      redirect_to topic_path(@topic), notice: "Topic was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def topics_post_params
    params.require(:topic).permit(:title, posts_attributes: [ :body])
  end

  def set_topic
    begin
      @topic = Topic.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end
end
