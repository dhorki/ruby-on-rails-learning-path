class AbilitiesPokemonsController < ApplicationController

  layout 'admin'

  before_action :ability_page

  def index
    @abilities_pokemons = AbilitiesPokemon.by_pokemon_name(params[:pokemon_id]).paginate(page: @ability_page)
  end

  def show
    @abilities_pokemon = AbilitiesPokemon.find(params[:id])
  end

  def new
    @abilities_pokemon = AbilitiesPokemon.new({:pokemon_id => params[:pokemon_id]} )
  end

  def create
    @abilities_pokemon = AbilitiesPokemon.new(abilities_pokemon_params)

    if @abilities_pokemon.save
      flash[:notice] = "The Pokemon Ability '#{@abilities_pokemon.ability.name} (id: #{@abilities_pokemon.ability.id})' for '#{@abilities_pokemon.pokemon.name} (id: #{@abilities_pokemon.pokemon.id})' was added successfully"
      redirect_to(abilities_pokemons_path(@abilities_pokemon, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :ability_page => @ability_page))
    else
      render('new')
    end
  end

  def edit
    @abilities_pokemon = AbilitiesPokemon.find(params[:id])
  end

  def update
    @abilities_pokemon = AbilitiesPokemon.find(params[:id])

    if @abilities_pokemon.update(abilities_pokemon_params)
      flash[:notice] = "The Pokemon Ability was updated successfully"
      redirect_to(abilities_pokemon_path(@abilities_pokemon, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :ability_page => @ability_page))
    else
      render('edit', :locals => {:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :ability_page => @ability_page})
    end
  end

  def delete
    @abilities_pokemon = AbilitiesPokemon.find(params[:id])
  end

  def destroy
    @abilities_pokemon = AbilitiesPokemon.find(params[:id])
    @abilities_pokemon.destroy
    flash[:notice] = "The Pokemon Ability '#{@abilities_pokemon.ability.name}' was removed successfully"
    redirect_to(abilities_pokemons_path(:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :ability_page => @ability_page))
  end

  private
  def abilities_pokemon_params
    params.require(:abilities_pokemon).permit(:pokemon_id, :ability_id, :is_hidden, :slot)
  end

  def ability_page
    @ability_page = params[:page] ? params[:page] : params[:ability_page]
  end
end

