class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  def admin_required
    if !admin_logged_in?
      flash[:info] = "You need to be logged in to perform this action"
      redirect_to login_path
    end
  end
end
