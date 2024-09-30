class PostsController < ApplicationController
  before_action :authenticate_user!

  def create   
    @post = current_user.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to users_path, notice: 'Post was successfully created.'
    else
      flash[:alert] = @post.errors.full_messages.to_sentence
      redirect_to users_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

end
