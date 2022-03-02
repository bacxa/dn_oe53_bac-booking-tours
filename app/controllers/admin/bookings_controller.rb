class Admin::BookingsController < Admin::AdminController
  before_action :load_booking, only: %i(update_status show)

  def index
    @bookings = Booking.newest.page(params[:page]).per Settings.tour.per_page
  end

  def show; end

  def update_status
    @booking.send("#{params[:confirm]}!")
    flash[:success] = t ".success"
    @user = @booking.user

    check_alert_booking
    redirect_to admin_booking_path
  end

  private

  def load_booking
    @booking = Booking.find_by(id: params[:id])
    return if @booking

    flash[:error] = t ".booking_not_found"
    redirect_to admin_root_path
  end

  def check_alert_booking
    alert_booking = Booking.find_by(id: params[:id])
    return if alert_booking.rejected? || alert_booking.waiting?

    NotificationService.new(to_user: @user, channel: @channel,
      from_user: current_user, booking: @booking, key: "alert_booking").perform
  end
end
