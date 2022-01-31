# frozen_string_literal: true

class TypesController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @types = Type.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @type = Type.find(params[:id])
  end

  def new
    @type = Type.new
  end

  def create
    @type = Type.new(type_params)

    if @type.save
      flash[:notice] = "The Type '#{@type.name} (id: #{@type.id})' was created successfully"
      redirect_to(types_path(@type, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @type = Type.find(params[:id])
  end

  def update
    @type = Type.find(params[:id])

    if @type.update(type_params)
      flash[:notice] = 'The Type was updated successfully'
      redirect_to(types_path(@type, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @type = Type.find(params[:id])
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:notice] = "The Type '#{@type.name}' was removed successfully"
    redirect_to(types_path(@nav_params))
  end

  private

  def type_params
    params.require(:type).permit(:name, :url)
  end

  def navigation_params
    @nav_params = {
      page: params[:page]
    }
  end
end
