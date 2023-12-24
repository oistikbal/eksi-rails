class Api::V1::TopicsController < ApplicationController
  def index
    begin
      @pagy, @topics = pagy(Topic.all)
      #render json: @topics.all, status: :ok
      render json: TopicSerializer.new(@topics).serializable_hash.to_json, status: :ok
    rescue Pagy::OverflowError
      render json: { error: 'No such page', status: :not_found }
    end
  end

  def show
    begin
      @topic = Topic.find(params[:id])
      @pagy, @posts = pagy(@topic.posts)
      render json: PostSerializer.new(@posts).serializable_hash.to_json, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'No such topic', status: :not_found }
    rescue Pagy::OverflowError
      render json: { error: 'No such page', status: :not_found }
    end
  end
end
