module Leaders::NotificationsHelper
  def unchecked_notifications
    @notifications = current_leader.passive_notifications.where(checked: false)
  end
end
