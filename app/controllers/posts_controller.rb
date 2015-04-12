class PostsController < InheritedResources::Base
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_status, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :action_before_authentication, only: [:edit, :update, :destroy]

  respond_to :html

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    respond_with(@post)
  end

  def index
    if user_signed_in?
      @posts = Post.all
    else
      @posts = Post.published
    end
  end

  def show
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :subtitle, :excerpt, :article, :date, :status)
    end

    def check_status
      if @post.status == true
        @post = Post.find(params[:id])
      else
        redirect_to(posts_path, notice: "Il post che hai cercato di leggere è ancora in bozza. Sollecita l'autore di pubblicarlo.")
      end
    end

    def action_before_authentication
      if current_user.id != @post.user_id
        redirect_to(posts_path, notice: "Sorry, you can't edit this post")
      end
    end
end
