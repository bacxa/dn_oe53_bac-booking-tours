class ToursController < ApplicationController
  before_action :set_tour, only: %i(show booking new_booking)

  def index
    @tours = Tour.all
  end

  def show; end

  def new_booking
    @booking = @tour.bookings.new
    @guests = @booking.guests.build
  end

  def booking
    @booking = @tour.bookings.new(booking_params.merge(user_id: current_user.id))
    if @booking.save
      redirect_to root_path
      flash[:success] = "Đặt thành công"
    else
      render :new_booking
    end
  end

  private

  def set_tour
    @tour = Tour.find_by(id: params[:id])
  end

  def booking_params
    params.require(:booking).permit(:est_start_date, :start_date, :tour_id, guests_attributes: [:id, :name, :dob, :passport, :phone_number, :_destroy])
  end
end
