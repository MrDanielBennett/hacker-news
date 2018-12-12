class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @user = current_user
    render :new
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    # binding.pry
    render :show
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
