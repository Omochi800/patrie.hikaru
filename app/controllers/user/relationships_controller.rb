class User::RelationshipsController < ApplicationController

  def index
    @user =  current_user
  end

  def create
    @user.create_notification_follow!(current_user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: root_url)}
      format.js
    end
  end

  def follow
    current_user.follow(params[:id])
    redirect_to user_path
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to user_path
  end
end
