class PagesController < ApplicationController
  include HighVoltage::StaticPage

  before_filter :all_info

  private

    def all_info
      case params[:id]
      when 'home'
        @books = Book.latest
        @authors = Author.random
        @posts = Post.includes(:user, :tags).published
        @videos = Video.home_video.first
      end
    end
end
