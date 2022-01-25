class Admin::AdminController < ActionController::Base
  include SessionsHelper
  layout "admin/admin"
  before_action :check_user, :check_admin

  private

  def check_user
    return if current_user

    redirect_to login_path
    flash[:danger] = t(".no_session")
  end

  def check_admin
    return if current_user.admin?

    redirect_to root_path
    flash[:danger] = t(".not_have_access")
  end
end
