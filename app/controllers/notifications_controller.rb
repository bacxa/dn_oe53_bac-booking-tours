class NotificationsController < ApplicationController
  before_action :set_notification

  def update
    @noti.update seen: true unless @noti.seen

    case @noti.key
    when t(".alert_booking")
      redirect_to @noti.booking.tour
    when t(".welcome")
      redirect_to root_path
    end
  end

  private

  def set_notification
    @noti = Notification.find_by(id: params[:id])
    redirect_to root_path unless @noti
  end
end
