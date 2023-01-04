class User::PostsController < ApplicationController
  def new
    @post = Post.new
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
    @post = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:image,:text,:user_id)
  end
end
