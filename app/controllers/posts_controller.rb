class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @event = Event.find_by_friendly_id!(params[:event_id])
    @post = Post.new
  end

  def create
    @event = Event.find_by_friendly_id!(params[:event_id])
    @post = Post.new(post_params)
    @post.event = @event
    @post.user = current_user

    if @post.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
