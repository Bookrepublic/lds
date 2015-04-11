class VideosController < ApplicationController
  before_action :set_video, only: [:show]

  def show
  end

  def index
    @videos = Video.all
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end
end
