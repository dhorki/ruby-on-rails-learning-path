# frozen_string_literal: true

Rails.application.routes.draw do
  ####################################################################
  root 'pokemons#index'

  get 'access', to: 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'

  ####################################################################

  resources :users do
    member do
      get :delete
    end
  end

  resources :forms_pokemons do
    member do
      get :delete
    end
  end

  resources :items_pokemons do
    member do
      get :delete
    end
  end

  resources :moves_pokemons do
    member do
      get :delete
    end
  end

  resources :pokemons_types do
    member do
      get :delete
    end
  end

  resources :abilities_pokemons do
    member do
      get :delete
    end
  end

  resources :pokemons_stats do
    member do
      get :delete
    end
  end

  resources :users, except: [:show] do
    member do
      get :delete
    end
  end

  resources :types do
    member do
      get :delete
    end
  end

  resources :stats do
    member do
      get :delete
    end
  end

  resources :moves do
    member do
      get :delete
    end
  end

  resources :items do
    member do
      get :delete
    end
  end

  resources :forms do
    member do
      get :delete
    end
  end

  resources :abilities do
    member do
      get :delete
    end
  end

  resources :species do
    member do
      get :delete
    end
  end

  resources :sprites do
    member do
      get :delete
    end
  end

  resources :pokemons do
    member do
      get :delete
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'loader/load'
end
