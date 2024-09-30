class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      respond_to do |format|
        redirect_to users_path, notice: 'Comment added successfully.' 
        #format.turbo_stream # For Turbo Streams if you want to use them
      end
    else
      redirect_to users_path, alert: 'Unable to add an empty comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
  