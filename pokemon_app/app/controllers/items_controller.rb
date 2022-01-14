class ItemsController < ApplicationController

  layout 'admin'

  def index
      @items = Item.alpha_sorted.paginate(:page => params[:page])
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
      redirect_to(items_path(@item, :page => params[:age]))
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
      flash[:notice] = "The Item was updated successfully"
      redirect_to(items_path(@item, :page => params[:age]))
    else
      render('edit', :locals => {:page => params[:page]})
    end
  end

  def delete
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "The Item '#{@item.name}' was removed successfully"
    redirect_to(items_path(:page => params[:page]))
  end

  private
  def item_params
    params.require(:item).permit(:name, :url)
  end
end
