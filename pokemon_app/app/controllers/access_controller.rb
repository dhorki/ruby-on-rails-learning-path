# frozen_string_literal: true

class AccessController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in, except: %i[login attempt_login logout]

  def menu
    # @username = session[:username]
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      authorized_user = found_user.authenticate(params[:password]) if found_user
    end

    if authorized_user
      p '--------------auth'
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = 'You are now logged in.'
      redirect_to(access_menu_path)
    else
      p '--------------else'
      flash.now[:notice] = 'Invalid username/password combination'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = 'Logged out'
    redirect_to(access_login_path)
  end
end
