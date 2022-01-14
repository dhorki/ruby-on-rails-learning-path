class PokemonsTypesController < ApplicationController

  layout 'admin'

  before_action :type_page

  def index
    @pokemon_types = PokemonsType.by_pokemon_name(params[:pokemon_id]).paginate(page: @type_page)
  end

  def show
    @pokemon_type = PokemonsType.find(params[:id])
  end

  def new
    @pokemon_type = PokemonsType.new({:pokemon_id => params[:pokemon_id]} )
  end

  def create
    @pokemon_type = PokemonsType.new(pokemon_type_params)

    if @pokemon_type.save
      flash[:notice] = "The Pokemon Type '#{@pokemon_type.type.name} (id: #{@pokemon_type.type.id})' for '#{@pokemon_type.pokemon.name} (id: #{@pokemon_type.pokemon.id})' was added successfully"
      redirect_to(pokemons_type_path(@pokemon_type, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :type_page => @type_page))
    else
      render('new')
    end
  end

  def edit
    @pokemon_type = PokemonsType.find(params[:id])
  end

  def update
    @pokemon_type = PokemonsType.find(params[:id])

    if @pokemon_type.update(pokemon_type_params)
      flash[:notice] = "The Pokemon Type was updated successfully"
      redirect_to(pokemons_type_path(@pokemon_type, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :type_page => @type_page))
    else
      render('edit', :locals => {:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :type_page => @type_page})
    end
  end

  def delete
    @pokemon_type = PokemonsType.find(params[:id])
  end

  def destroy
    @pokemon_type = PokemonsType.find(params[:id])
    @pokemon_type.destroy
    flash[:notice] = "The Pokemon Type '#{@pokemon_type.type.name}' was removed successfully"
    redirect_to(pokemons_types_path(:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :type_page => @type_page))
  end

  private
  def pokemon_type_params
    params.require(:pokemons_type).permit(:pokemon_id, :type_id, :slot)
  end

  def type_page
    @type_page = params[:page] ? params[:page] : params[:type_page]
  end
end
