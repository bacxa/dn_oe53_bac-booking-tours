class ToursController < ApplicationController
  before_action :set_tour, only: %i(show booking new_booking rate new_rate)

  def index
    @tours = Tour.all
  end

  def show
    @rates = @tour.rates
  end

  def new_booking
    @booking = @tour.bookings.new
    @guests = @booking.guests.build
  end

  def booking
    @booking = @tour.bookings.new(booking_params.merge(user_id: current_user.id))
    if @booking.save
      redirect_to root_path
    else
      render :new_booking
    end
  end

  def new_rate
    @rate = @tour.rates.new
  end

  def rate
    @rate = @tour.rates.new(rate_params.merge(user_id: current_user.id))
    if @rate.save
      @rates = @tour.rates
      respond_to do |format|
        format.js
      end
    else
      render :new
    end
  end
  private

  def set_tour
    @tour = Tour.find_by(id: params[:id])
  end

  def rate_params
    params.require(:rate).permit(:rating, :comment)
  end

  def booking_params
    params.require(:booking).permit(:est_start_date, :start_date, :tour_id, guests_attributes: [:id, :name, :dob, :passport, :phone_number, :_destroy])
  end
end
