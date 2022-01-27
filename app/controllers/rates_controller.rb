class RatesController < ApplicationController
  def new
    @rate = Rate.new
  end

  def create
    @rate = Rate.new(rate_params merge(user_id: current_user.id))
    if @rate.save
      redirect_to @tour
    else
      render :new
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:rating, :comment)
  end

  def set_tour
    @tour = Tour.find_by(id: params[:id])
  end
end
