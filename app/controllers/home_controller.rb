class HomeController < ApplicationController
  def index
    @tours = Tour.newest.page(params[:page]).per Settings.tour.per_page
    @q = Tour.ransack params[:q]
  end
end
