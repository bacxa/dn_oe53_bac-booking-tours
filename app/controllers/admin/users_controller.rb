class Admin::UsersController < Admin::AdminController
  before_action :load_user, only: %i(destroy)

  def index
    @q = User.ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.tour.per_page
  end

  def destroy
    @user.delete
    respond_to do |format|
      format.html{redirect_to admin_users_path}
      format.js
    end
  end

  def show; end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:error] = t ".user_not_found"
    redirect_to root_path
  end
end
