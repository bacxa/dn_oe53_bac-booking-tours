class Notification < ApplicationRecord
  after_create :send_notification

  belongs_to :from_user, class_name: "User", optional: true
  belongs_to :to_user, class_name: "User"
  belongs_to :booking, optional: true

  enum key: {welcome: 2, alert_booking: 1}

  scope :newest, ->{order(created_at: :desc)}
  scope :not_seen, ->{where(seen: false)}

  def group_user_count
    notification_group_users.count
  end

  private

  def send_notification
    NotificationBroadcastJob.perform_now(self)
  end
end
