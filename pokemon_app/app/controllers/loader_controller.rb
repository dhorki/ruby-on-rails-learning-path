# frozen_string_literal: true

class LoaderController < ApplicationController
  before_action :confirm_logged_in

  def load
    loader = PokeapiLoader.new
    loader.pokemons
  end
end
