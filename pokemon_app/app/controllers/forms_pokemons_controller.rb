# frozen_string_literal: true

class FormsPokemonsController < ApplicationController
  layout 'admin'

  before_action :form_page
  before_action :navigation_params

  def index
    @forms_pokemons = FormsPokemon.by_pokemon_name(params[:pokemon_id]).paginate(page: @form_page)
  end

  def show
    @forms_pokemon = FormsPokemon.find(params[:id])
  end

  def new
    @forms_pokemon = FormsPokemon.new({ pokemon_id: params[:pokemon_id] })
  end

  def create
    @forms_pokemon = FormsPokemon.new(forms_pokemon_params)

    if @forms_pokemon.save
      flash[:notice] =
        "The Pokemon Form '#{@forms_pokemon.form.name} (id: #{@forms_pokemon.form.id})' "\
        "for '#{@forms_pokemon.pokemon.name} (id: #{@forms_pokemon.pokemon.id})' was added successfully"
      redirect_to(forms_pokemons_path(@forms_pokemon, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @forms_pokemon = FormsPokemon.find(params[:id])
  end

  def update
    @forms_pokemon = FormsPokemon.find(params[:id])

    if @forms_pokemon.update(forms_pokemon_params)
      flash[:notice] = 'The Pokemon Form was updated successfully'
      redirect_to(forms_pokemon_path(@forms_pokemon, @nav_params))
    else
      render('edit', locals: @nav_params)
    end
  end

  def delete
    @forms_pokemon = FormsPokemon.find(params[:id])
  end

  def destroy
    @forms_pokemon = FormsPokemon.find(params[:id])
    @forms_pokemon.destroy
    flash[:notice] = "The Pokemon Form '#{@forms_pokemon.form.name}' was removed successfully"
    redirect_to(forms_pokemons_path(@nav_params))
  end

  private

  def forms_pokemon_params
    params.require(:forms_pokemon).permit(:pokemon_id, :form_id)
  end

  def form_page
    @form_page = params[:page] || params[:form_page]
  end

  def navigation_params
    @nav_params = {
      pokemon_id: params[:pokemon_id],
      pokemon_page: params[:pokemon_page],
      form_page: @form_page
    }
  end
end
