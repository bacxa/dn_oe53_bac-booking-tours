class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

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
