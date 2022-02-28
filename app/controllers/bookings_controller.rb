class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @guests = @booking.guests.build
  end

  def create
    @booking = current_user.bookings.new(booking_params.merge(tour_id:
      params[:tour_id]))
    if @booking.save
      redirect_to root_path
      flash[:success] = t ".success"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:est_start_date, :start_date, :tour_id,
                                    guests_attributes: [:id, :name, :dob,
                                    :passport, :phone_number, :_destroy])
  end
end
