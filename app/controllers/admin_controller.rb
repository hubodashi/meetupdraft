class AdminController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  layout "admin"

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = 'You are not admin'
      redirect_to root_path
    end
  end

end
