class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:name, :email, :password])
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def check_require_login
    return if current_user

    redirect_to login_path
    flash[:danger] = t ".no_session"
  end
end
