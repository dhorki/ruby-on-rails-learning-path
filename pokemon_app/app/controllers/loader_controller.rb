# frozen_string_literal: true

class LoaderController < ApplicationController
  def load
    loader = PokeapiLoader.new
    loader.pokemons
  end
end
