class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def show
  end

  def index
    @videos = Video.includes(:sponsors, :writers, :pubblications, :books, :authors).published
    @sponsors = Sponsor.all.order("last_name asc")
    @tags = Tag.all.order("tag asc")
    @books = Book.published.order("title asc")
    @writers = Writer.all.order("last_name asc")
    @pubblications = Pubblication.all.order("title asc")
  end

  private

    def set_video
      @video = Video.includes(:sponsors, :writers, :pubblications).published.friendly.find(params[:id])
    end
end
