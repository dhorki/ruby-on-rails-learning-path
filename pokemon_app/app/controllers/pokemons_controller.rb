# frozen_string_literal: true

class PokemonsController < ApplicationController
  layout 'admin'

  before_action :pokemon_page
  before_action :navigation_params

  def index
    @pokemons = Pokemon.alpha_sorted.paginate(page: @pokemon_page)
    @page = @pokemon_page
    respond_to do |format|
      format.html
      format.json { render json: @pokemon }
    end
    # render('index')         # index is rendered by default
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @pokemon }
    end
  end

  def new
    @pokemon = Pokemon.new({ is_custom: true })
  end

  def create
    # @pokemon = Pokemon.new(params[:pokemon])    # this fails due to mass assignment
    @pokemon = Pokemon.new(pokemon_params)

    if @pokemon.save
      flash[:notice] = "The Pokemon '#{@pokemon.name} (id: #{@pokemon.id})' was created successfully"
      redirect_to(pokemons_path)
    else
      render('new')
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      flash[:notice] = 'The Pokemon was updated successfully'
      redirect_to(pokemon_path(@pokemon, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "The Pokemon '#{@pokemon.name} (id: #{@pokemon.id})' was destroyed successfully"
    redirect_to(pokemons_path(@nav_params))
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:pokeapi_id, :name, :height, :weight, :order, :base_experience, :is_custom,
                                    :species_id)
  end

  def pokemon_page
    @pokemon_page = params[:page] || params[:pokemon_page]
  end

  def navigation_params
    @nav_params = {
      pokemon_page: @pokemon_page
    }
  end
end
