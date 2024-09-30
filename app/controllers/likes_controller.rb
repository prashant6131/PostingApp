class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to users_path, notice: 'Post liked successfully.'
    else
      redirect_to users_path, alert: 'You have already liked this post.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_by(post: @post)

    if @like.destroy
      redirect_to users_path, notice: 'Post unliked successfully.'
    else
      redirect_to users_path, alert: 'Unable to unlike post.'
    end
  end
end
  