class PostsController < ApplicationController
  def index
    @posts = Post.order(points: :desc, created_at: :desc).all
    render :index
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    # binding.pry
    render :show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :link, :points)
  end
end
