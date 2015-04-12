class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user.posts = Post.all
    else
      @user.posts = Post.published
    end
  end

  private

    def set_user
      @user = User.includes(:posts).find(params[:id])
    end

end
