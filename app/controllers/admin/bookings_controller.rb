class Admin::BookingsController < Admin::AdminController
  before_action :set_users_channel, only: %i(update_status)


  def index
    @bookings = Booking.all
  end

  def update_status
    # @booking.send("#{params[:confirm]}!") if @booking && @booking.waiting?

    # redirect_to admin_bookings_path
  end

  private

  def set_users_channel
    @booking = Booking.find_by(id: params[:id])
  end
end
