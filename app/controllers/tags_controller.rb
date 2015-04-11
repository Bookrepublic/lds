class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def index
    @tags = Tag.all
  end

  private

    def set_tag
      @tag = Tag.includes(:posts).find(params[:id])
    end
end
