class ToursController < ApplicationController
  before_action :load_tour, only: %i(show)

  def index
    @q = Tour.ransack params[:q]
    @tours = @q.result.newest.page(params[:page]).per Settings.tour.per_page
  end

  def show
    @q = Tour.ransack params[:q]
  end

  private

  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:error] = t ".tour_not_found"
    redirect_to root_path
  end
end
