class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user =  current_user
    @user = User.find(params[:id])
    @posts = @user.posts
    @likes = Like.where(user_id:current_user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def unsubscribe
  end

  private

  def user_params
    params.require(:user).permit(:user_name,:profile_image,:intoduction,:name)
  end
end
