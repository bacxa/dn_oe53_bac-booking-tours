class ToursController < ApplicationController
  before_action :load_tour, only: %i(show)

  def show; end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:error] = t ".tour_not_found"
    redirect_to root_path
  end
end
