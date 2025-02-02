# frozen_string_literal: true

class SpritesController < ApplicationController
  layout 'admin'

  before_action :navigation_params

  def index
    @sprites = Sprite.by_pokemon_name(params[:pokemon_id]).paginate(page: params[:page])
  end

  def show
    @sprite = Sprite.find(params[:id])
  end

  def new
    @sprite = Sprite.new(pokemon_id: params[:pokemon_id])
  end

  def create
    @sprite = Sprite.new(sprite_params)

    if @sprite.save
      flash[:notice] = "The Sprite for Pokemon '#{@sprite.pokemon.name}' was created successfully"
      redirect_to(sprites_path(@sprite, @nav_params))
    else
      render('new')
    end
  end

  def edit
    @sprite = Sprite.find(params[:id])
  end

  def update
    @sprite = Sprite.find(params[:id])

    if @sprite.update(sprite_params)
      flash[:notice] = 'The Sprite was updated successfully'
      redirect_to(sprites_path(@sprite, @nav_params))
    else
      render('edit', locals: { page: @nav_params })
    end
  end

  def delete
    @sprite = Sprite.find(params[:id])
  end

  def destroy
    @sprite = Sprite.find(params[:id])
    # @sprite.pokemon.sprite = nil
    # @sprite.pokemon.save
    @sprite.destroy
    flash[:notice] = "The Sprite for Pokemon '#{@sprite.pokemon.name}' was removed successfully"
    redirect_to(sprites_path(@nav_params))
  end

  private

  def sprite_params
    params.require(:sprite).permit(:pokemon_id, :back_default, :back_female, :back_shiny, :back_shiny_female,
                                   :front_default, :front_female, :front_shiny, :front_shiny_female,
                                   :official_artwork_front_default)
  end

  def navigation_params
    @nav_params = {
      pokemon_id: params[:pokemon_id],
      pokemon_page: params[:pokemon_page],
      page: params[:page]
    }
  end
end
