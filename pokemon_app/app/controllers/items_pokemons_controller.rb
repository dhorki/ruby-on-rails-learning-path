# frozen_string_literal: true

class ItemsPokemonsController < ApplicationController
  layout 'admin'

  before_action :item_page
  before_action :navigation_params

  def index
    @items_pokemons = ItemsPokemon.by_pokemon_name(params[:pokemon_id]).paginate(page: @item_page)
  end

  def show
    @items_pokemon = ItemsPokemon.find(params[:id])
  end

  def new
    @items_pokemon = ItemsPokemon.new({ pokemon_id: params[:pokemon_id] })
  end

  def create
    @items_pokemon = ItemsPokemon.new(items_pokemon_params)

    if @items_pokemon.save
      flash[:notice] =
        "The Pokemon Item '#{@items_pokemon.item.name} (id: #{@items_pokemon.item.id})' "\
        "for '#{@items_pokemon.pokemon.name} (id: #{@items_pokemon.pokemon.id})' was added successfully"
      redirect_to(items_pokemons_path(@items_pokemon, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @items_pokemon = ItemsPokemon.find(params[:id])
  end

  def update
    @items_pokemon = ItemsPokemon.find(params[:id])

    if @items_pokemon.update(items_pokemon_params)
      flash[:notice] = 'The Pokemon Item was updated successfully'
      redirect_to(items_pokemon_path(@items_pokemon, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @items_pokemon = ItemsPokemon.find(params[:id])
  end

  def destroy
    @items_pokemon = ItemsPokemon.find(params[:id])
    @items_pokemon.destroy
    flash[:notice] = "The Pokemon Item '#{@items_pokemon.item.name}' was removed successfully"
    redirect_to(items_pokemons_path(@nav_params))
  end

  private

  def items_pokemon_params
    params.require(:items_pokemon).permit(:pokemon_id, :item_id)
  end

  def item_page
    @item_page = params[:page] || params[:item_page]
  end

  def navigation_params
    @nav_params = {
      pokemon_id: params[:pokemon_id],
      pokemon_page: params[:pokemon_page],
      form_page: @form_page
    }
  end
end
