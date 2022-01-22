class Admin::ToursController < Admin::AdminController
  before_action :set_tour, only: %i[show edit update destroy]

  def index
    @tours = Tour.all
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new tour_params
    @tour.save ? redirect_to(admin_tours_path) : render(:new)
  end

  def show; end

  def edit; end

  def update
    @tour.update(tour_params) ? redirect_to(admin_tours_path) : render(:edit)
  end

  def destroy
    @tour.destroy
    redirect_to admin_tours_path
  end

  private

  def set_tour
    @tour = Tour.find_by(id: params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :description, :price, :sort, :max_guest, :min_guest,
      :duration, :info_regular, :images)
  end
end