class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @posts = @user.posts
  end
  def edit
    @user = current_user.id

  end

end
