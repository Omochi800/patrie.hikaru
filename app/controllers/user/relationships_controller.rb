class User::RelationshipsController < ApplicationController

  def index
    @user =  current_user
  end


  def follow
    current_user.follow(params[:id])
    redirect_to root_path
  end

  def unfollow
    current_user.unfollow(params[:id])
    redirect_to root_path
  end
end
