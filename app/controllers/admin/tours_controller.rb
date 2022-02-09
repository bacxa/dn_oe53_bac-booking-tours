class Admin::ToursController < Admin::AdminController
  def index
    @tours = Tour.newest.page(params[:page]).per Settings.tour.admin_per_page
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new tour_params
    if @tour.save
      redirect_to admin_tours_path
      flash[:success] = t ".success"
    else
      render :new
    end
  end

  private

  def tour_params
    params.require(:tour).permit :name, :description, :price, :sort, :max_guest,
                                 :min_guest, :duration, :info_regular, :avatar
  end
end
