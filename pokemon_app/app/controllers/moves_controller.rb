# frozen_string_literal: true

class MovesController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @moves = Move.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @move = Move.find(params[:id])
  end

  def new
    @move = Move.new
  end

  def create
    @move = Move.new(move_params)

    if @move.save
      flash[:notice] = "The Move '#{@move.name} (id: #{@move.id})' was created successfully"
      redirect_to(moves_path(@move, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    @move = Move.find(params[:id])

    if @move.update(move_params)
      flash[:notice] = 'The Move was updated successfully'
      redirect_to(moves_path(@move, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @move = Move.find(params[:id])
  end

  def destroy
    @move = Move.find(params[:id])
    @move.destroy
    flash[:notice] = "The Move '#{@move.name}' was removed successfully"
    redirect_to(moves_path(@nav_params))
  end

  private

  def move_params
    params.require(:move).permit(:name, :url)
  end

  def navigation_params
    @nav_params = {
      page: params[:page]
    }
  end
end
