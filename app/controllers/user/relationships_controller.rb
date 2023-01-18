class User::RelationshipsController < ApplicationController

  def create
    @user.create_notification_follow!(current_user)
  end
  def follow
    current_user.follow(params[:id])
    redirect_to user_path(user)
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to user_path(user)
  end
end
