class SpeciesController < ApplicationController

  layout 'admin'

  def index
      @species = Species.alpha_sorted.paginate(:page => params[:page])
  end

  def show
    @species = Species.find(params[:id])
  end

  def new
    @species = Species.new
  end

  def create
    @species = Species.new(species_params)

    if @species.save
      flash[:notice] = "The Species '#{@species.name} (id: #{@species.id})' was created successfully"
      redirect_to(species_path(@species, :page => params[:age]))
    else
      render('new')
    end
  end

  def edit
    @species = Species.find(params[:id])
  end

  def update
    @species = Species.find(params[:id])

    if @species.update(species_params)
      flash[:notice] = "The Species was updated successfully"
      redirect_to(species_index_path(@species, :page => params[:age]))
    else
      render('edit', :locals => {:page => params[:page]})
    end
  end

  def delete
    @species = Species.find(params[:id])
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    flash[:notice] = "The Species '#{@species.name}' was removed successfully"
    redirect_to(species_index_path(:page => params[:page]))
  end

  private
  def species_params
    params.require(:species).permit(:name, :url)
  end
end

