class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def show
  end

  def index
    @videos = Video.includes(:sponsors, :writers, :pubblications).all
  end

  private

    def set_video
      @video = Video.includes(:sponsors, :writers, :pubblications).find(params[:id])
    end
end
