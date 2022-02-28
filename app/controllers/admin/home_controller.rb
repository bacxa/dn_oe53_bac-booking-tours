class Admin::HomeController < Admin::AdminController
  authorize_resource class: false
  def index; end
end
