class MovesPokemonsController < ApplicationController

  layout 'admin'

  before_action :move_page

  def index
    @moves_pokemons = MovesPokemon.by_pokemon_name(params[:pokemon_id]).paginate(page: @move_page)
  end

  def show
    @moves_pokemon = MovesPokemon.find(params[:id])
  end

  def new
    @moves_pokemon = MovesPokemon.new({:pokemon_id => params[:pokemon_id]} )
  end

  def create
    @moves_pokemon = MovesPokemon.new(moves_pokemon_params)

    if @moves_pokemon.save
      flash[:notice] = "The Pokemon Move '#{@moves_pokemon.move.name} (id: #{@moves_pokemon.move.id})' for '#{@moves_pokemon.pokemon.name} (id: #{@moves_pokemon.pokemon.id})' was added successfully"
      redirect_to(moves_pokemons_path(@moves_pokemon, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :move_page => @move_page))
    else
      render('new')
    end
  end

  def edit
    @moves_pokemon = MovesPokemon.find(params[:id])
  end

  def update
    @moves_pokemon = MovesPokemon.find(params[:id])

    if @moves_pokemon.update(moves_pokemon_params)
      flash[:notice] = "The Pokemon Move was updated successfully"
      redirect_to(moves_pokemon_path(@moves_pokemon, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :move_page => @move_page))
    else
      render('edit', :locals => {:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :move_page => @move_page})
    end
  end

  def delete
    @moves_pokemon = MovesPokemon.find(params[:id])
  end

  def destroy
    @moves_pokemon = MovesPokemon.find(params[:id])
    @moves_pokemon.destroy
    flash[:notice] = "The Pokemon Move '#{@moves_pokemon.move.name}' was removed successfully"
    redirect_to(moves_pokemons_path(:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :move_page => @move_page))
  end

  private
  def moves_pokemon_params
    params.require(:moves_pokemon).permit(:pokemon_id, :move_id)
  end

  def move_page
    @move_page = params[:page] ? params[:page] : params[:move_page]
  end
  
end

