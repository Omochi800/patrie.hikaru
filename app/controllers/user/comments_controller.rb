class User::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      flash[:success] = 'コメントしました'
      @post = @comment.post
      @post.create_notification_comment!(current_user, @comment.id)
      redirect_to @comment.post
    else
      render templete: 'posts/show'
    end  
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:post_id,:user_id,:content)
  end
end
