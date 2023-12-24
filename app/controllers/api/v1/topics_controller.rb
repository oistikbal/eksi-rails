class Api::V1::TopicsController < ApplicationController
  def index
    @pagy, @topics = pagy(Topic.all)
    render json: @topics.all, status: :ok
  end

  def show
    begin
      @topic = Topic.find(params[:id])
      @pagy, @posts = pagy(@topic.posts)
      render json: @posts.all, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: {error: 'No such topic', status: :not_found}
    end
  end
end
