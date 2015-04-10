class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :all_info

  private

    def all_info
      case params[:id]
      when 'home'
        @books = Book.includes(:authors).all
        @authors = Author.all
        @users = User.all
        @posts = Post.includes(:user, :tags).published
      end
    end
end
