class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  if@user.update(user_params)
    redirect_to admin_user_path
  else
    render:edit
  end
  end

  private

  def
    user_params
    params.require(:user).permit(:name,:user_name,:email,:is_deleted)
  end
end
