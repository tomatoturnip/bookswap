module ApplicationHelper
  def unread_count
    current_user.messages.where(unread: true).count
  end
end
