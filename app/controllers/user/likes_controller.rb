class User::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id:post.id)
    like.save
    post.create_notification_like!(current_user)
    respond_to do |format|
      format.html {redirect_back(fallback_location: 'users/show')}
      format.js
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id:post.id)
    like.destroy
    redirect_to post_path(post)
  end
end
