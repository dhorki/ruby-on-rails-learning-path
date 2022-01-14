class LoaderController < ApplicationController
  def load
    loader = PokeapiLoader.new
    loader.pokemons
  end
end
