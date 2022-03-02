class NotificationService
  attr_accessor :from_user, :to_user, :booking, :key

  def initialize **args
    @from_user = args[:from_user]
    @to_user = args[:to_user]
    @booking = args[:booking]
    @key = args[:key]
  end

  def perform
    case key
    when "alert_booking"
      Notification.create to_user_id: to_user.id, from_user_id: from_user.id,
        booking_id: booking.id, key: key
    when "welcome"
      Notification.create to_user_id: to_user.id, key: key
    end
  end
end
