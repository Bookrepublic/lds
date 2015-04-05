class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:title, :subtitle, :excerpt, :article, :date, :status)
    end
end

