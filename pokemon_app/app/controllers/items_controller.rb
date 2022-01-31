# frozen_string_literal: true

class ItemsController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @items = Item.alpha_sorted.paginate(page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = "The Item '#{@item.name} (id: #{@item.id})' was created successfully"
      redirect_to(items_path(@item, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      flash[:notice] = 'The Item was updated successfully'
      redirect_to(items_path(@item, page: params[:age]))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "The Item '#{@item.name}' was removed successfully"
    redirect_to(items_path(@nav_params))
  end

  private

  def item_params
    params.require(:item).permit(:name, :url)
  end

  def navigation_params
    @nav_params = {
      pokemon_id: params[:pokemon_id],
      pokemon_page: params[:pokemon_page],
      form_page: @form_page
    }
  end
end
