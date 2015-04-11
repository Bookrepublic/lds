class AuthorsController < InheritedResources::Base
  before_action :set_author, only: [:show]

  private
    def set_author
      @author = Author.includes(:books).includes(:videos).find(params[:id])
    end

    def author_params
      params.require(:author).permit(:first_name, :last_name, :biography)
    end
end

