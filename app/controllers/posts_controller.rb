class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  # create method is always a post method, so it doesn't need a view
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def get_post
  @post = Post.find(params[:id])
end
end
