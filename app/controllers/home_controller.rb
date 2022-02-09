class HomeController < ApplicationController
  def index
    @tours = Tour.newest.page(params[:page]).per Settings.tour.per_page
  end
end
