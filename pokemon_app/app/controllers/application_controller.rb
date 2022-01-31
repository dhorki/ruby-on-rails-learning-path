# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    return if user_logged_in?

    flash[:notice] = 'Please log in'

    # redirect to to prevent the action from running
    redirect_to(access_login_path)
  end
end
