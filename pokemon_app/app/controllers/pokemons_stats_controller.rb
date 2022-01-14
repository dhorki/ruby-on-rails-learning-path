class PokemonsStatsController < ApplicationController

  layout 'admin'

  before_action :stat_page

  def index
    @pokemon_stats = PokemonsStat.by_pokemon_name(params[:pokemon_id]).paginate(page: @stat_page)
  end

  def show
    @pokemon_stat = PokemonsStat.find(params[:id])
  end

  def new
    @pokemon_stat = PokemonsStat.new({:pokemon_id => params[:pokemon_id]} )
  end

  def create
    @pokemon_stat = PokemonsStat.new(pokemon_stat_params)

    if @pokemon_stat.save
      flash[:notice] = "The Pokemon Stat '#{@pokemon_stat.stat.name} (id: #{@pokemon_stat.stat.id})' for '#{@pokemon_stat.pokemon.name} (id: #{@pokemon_stat.pokemon.id})' was added successfully"
      redirect_to(pokemons_stat_path(@pokemon_stat, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :stat_page => @stat_page))
    else
      render('new')
    end
  end

  def edit
    @pokemon_stat = PokemonsStat.find(params[:id])
  end

  def update
    @pokemon_stat = PokemonsStat.find(params[:id])

    if @pokemon_stat.update(pokemon_stat_params)
      flash[:notice] = "The Pokemon Stat was updated successfully"
      redirect_to(pokemons_stat_path(@pokemon_stat, :pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :stat_page => @stat_page))
    else
      render('edit', :locals => {:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :stat_page => @stat_page})
    end
  end

  def delete
    @pokemon_stat = PokemonsStat.find(params[:id])
  end

  def destroy
    @pokemon_stat = PokemonsStat.find(params[:id])
    @pokemon_stat.destroy
    flash[:notice] = "The Pokemon Stat '#{@pokemon_stat.stat.name}' was removed successfully"
    redirect_to(pokemons_stats_path(:pokemon_id => params[:pokemon_id], :pokemon_page => params[:pokemon_page], :stat_page => @stat_page))
  end

  private
  def pokemon_stat_params
    params.require(:pokemons_stat).permit(:pokemon_id, :stat_id, :base_stat)
  end

  def stat_page
    @stat_page = params[:page] ? params[:page] : params[:stat_page]
  end
end
