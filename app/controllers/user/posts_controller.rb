class User::PostsController < ApplicationController
  def new
    @post = Post.new
    @user =  current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save
     redirect_to posts_path
  end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.user.id)
    @comment = Comment.new
    @comments = @post.comments
    @likes = Like.where(user_id:current_user.id)
  end

  def edit

  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    @user =  current_user
    @posts = Post.all
    @feeds = current_user.posts.page(params[:page]).per(3)
    @likes = Like.where(user_id:current_user.id)
  end

  def search
    if params[:keyword].present?
      @posts = Post.where('caption LIKE ?',"%#{params[:keyword]}%")
      @keyword = params[:keyword]
    else
      @posts = Post.all
    end
  end

  private

  def post_params
    params.require(:post).permit(:text,:user_id,:image)
  end
end
