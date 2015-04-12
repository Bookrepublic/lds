class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show]

  def show

  end

  def index
    @collections = Collection.all
  end

  private

    def set_collection
      @collection = Collection.includes(:books).find(params[:id])
    end
end
