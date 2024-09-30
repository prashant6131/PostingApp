class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.order(created_at: :desc) # Or filter posts as needed
    @post = Post.new # Initialize for the form
  end
end
