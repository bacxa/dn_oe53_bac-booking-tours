class Admin::BookingsController < Admin::AdminController
  before_action :set_booking, only: %i(update_status, show)

  def index
    @bookings = Booking.newest.search(params[:search]).page(params[:page]).per Settings.tour.admin_per_page
  end

  def show

  end
  def update_status
    @booking = Booking.find_by(id: params[:id])
    @booking.send("#{params[:confirm]}!")
    redirect_to admin_booking_path
    flash[:success] = t ".success"
  end

  private

  def set_booking
    @booking = Booking.find_by(id: params[:id])
  end
end
