module User::NotificationsHelper
  def notification_form(notification)
    @visitor = notification.visitor
    @comment = nil
    @your_post = link_to 'あなたの投稿',post_path(notification),style:"font-weight: bold;"
    @visitor_comment = notification.comment_id
    case notification.action
      when "follow" then
        tag.a(notification.visitor.user_name,href:user_path(@visitor),style:"font-weight: bold;")+"があなたをフォローしました"
      when "like" then
        tag.a(notification.visitor.user_name,href:user_path(@visitor),style:"font-weight: bold;")+"が"+tag.a('あなたの投稿',href:post_path(notification.post_id),style:"font-weight: bold;")+"をいいねしました"
      when "comment" then
        tag.a(notification.visitor.user_name,href:user_path(@visitor),style:"font-weight: bold;")+"が"+tag.a('あなたの投稿',href:post_path(notification.post_id),style:"font-weight: bold;")+"にコメントしました"
    end
  end

  def unchecked_notifications
    @notifications = current_user.passive_notifications.where(checked: false)
  end
end
