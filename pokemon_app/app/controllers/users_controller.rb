# frozen_string_literal: true

class UsersController < ApplicationController
  layout 'admin'

  before_action :confirm_logged_in
  before_action :navigation_params
  before_action :set_password_params, only: :update

  def index
    @users = User.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "The User '#{@user.username} (id: #{@user.id})' was created successfully"
      redirect_to(users_path(@user, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'The User was updated successfully'
      redirect_to(users_path(@user, page: params[:age]))
    else
      render('edit', locals: @password_params)
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "The User '#{@user.username}' was deleted successfully"
    redirect_to(users_path(@nav_params))
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end

  def navigation_params
    @nav_params = {
      page: params[:page]
    }
  end

  def set_password_params
    @password_params = @nav_params
    @password_params[:set_password] = params[:set_password]
  end
end
