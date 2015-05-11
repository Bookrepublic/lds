class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def show
  end

  def index
    @videos = Video.includes(:sponsors, :writers, :pubblications).published
  end

  private

    def set_video
      @video = Video.includes(:sponsors, :writers, :pubblications).published.find(params[:id])
    end
end
