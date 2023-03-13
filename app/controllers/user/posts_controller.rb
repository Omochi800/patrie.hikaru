class User::PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
    @user =  current_user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
  if @post.save
    flash[:success] = '投稿しました'
     redirect_to posts_path
  else
    render :new
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
  if@post.update(post_params)
    redirect_to post_path(@post)
  else
    render :edit
  end
  end

  def destroy
    @post = Post.find(params[:id])
  if  @post.destroy
    redirect_to posts_path
  else
    render :show
  end
  end

  def index
    @user =  current_user
    @posts = Post.all
    @feeds = Post.where(user_id:[current_user.id,*current_user.following_user]).page(params[:page]).per(3)
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