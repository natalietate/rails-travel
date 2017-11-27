class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    get_post
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

  # this has a view
  def edit
    get_post
  end

  # this is a patch request and doesn't need a view
  def update
    get_post
    if @post.update(post_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  # this is a destroy request and doesn't need a view
  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
