class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless user_logged_in?
      flash[:notice] = "Please log in"
      redirect_to(access_login_path)
      # redirect to to prevent the action from running
    end
  end

end
