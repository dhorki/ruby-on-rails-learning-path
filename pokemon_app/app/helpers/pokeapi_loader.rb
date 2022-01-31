# frozen_string_literal: true

class PokeapiLoader
  include HTTParty	# include methods
  base_uri 'https://pokeapi.co/api/v2'
  attr_reader :list

  POKEMON_SERVICE = '/pokemon'
  POKEMON_SERVICE_PROBE = "#{POKEMON_SERVICE}?limit=1".freeze
  POKEMON_SERVICE_FETCH_LIMIT = 100
  POKEMON_SERVICE_FETCH = "#{POKEMON_SERVICE}?limit=#{POKEMON_SERVICE_FETCH_LIMIT}&offset=".freeze

  def initialize
    @list = []
  end

  def add_abilities(abilities, db_pokemon)
    # process the abilities if any
    return unless abilities.size.positive?

    # cycle through all abilities and add them to the db if missing
    abilities.each do |ability|
      ability_name = ability['ability']['name']
      db_ability = Ability.find_by_name(ability_name)
      unless db_ability
        db_ability = Ability.new
        db_ability.name = ability_name
        db_ability.url = ability['ability']['url']
      end

      pokemon_ability = AbilitiesPokemon.new
      pokemon_ability.pokemon = db_pokemon
      pokemon_ability.is_hidden = ability['is_hidden']
      pokemon_ability.slot = ability['slot']

      # relate it to the pokemon_ability join
      pokemon_ability.ability = db_ability

      # save ability
      pokemon_ability.save
    end
  end

  def add_forms(forms, db_pokemon)
    # process forms if any
    return unless forms.size.positive?

    # cycle through all forms and add them to the db if missing
    forms.each do |form|
      form_name = form['name']
      db_form = Form.find_by_name(form_name)
      unless db_form
        db_form = Form.new
        db_form.name = form_name
        db_form.url = form['url']
      end

      # relate it to the pokemon
      db_pokemon.forms << db_form

      # save form
      db_form.save
    end
  end

  def add_held_items(held_items, db_pokemon)
    # process items if any
    return unless held_items.size.positive?

    # cycle through all held_items and add them to the db if missing
    held_items.each do |held_item|
      held_item_name = held_item['item']['name']
      db_item = Item.find_by_name(held_item_name)
      unless db_item
        db_item = Item.new
        db_item.name = held_item_name
        db_item.url = held_item['item']['url']
      end

      # relate it to the pokemon
      db_pokemon.items << db_item

      # save item
      db_item.save
    end
  end

  def add_moves(moves, db_pokemon)
    # process moves if any
    return unless moves.size.positive?

    # cycle through all moves and add them to the db if missing
    moves.each do |move|
      move_name = move['move']['name']
      db_move = Move.find_by_name(move_name)
      unless db_move
        db_move = Move.new
        db_move.name = move_name
        db_move.url = move['move']['url']
      end

      # relate it to the pokemon
      db_pokemon.moves << db_move

      # save move
      db_move.save
    end
  end

  def set_species(species, db_pokemon)
    species_name = species['name']
    db_species = Species.find_by_name(species_name)
    unless db_species
      db_species = Species.new
      db_species.name = species_name
      db_species.url = species['url']
    end

    db_pokemon.species = db_species

    # save species
    db_species.save
  end

  def set_sprites(sprites, db_pokemon)
    db_sprites = Sprite.new
    db_sprites.back_default = sprites['back_default']
    db_sprites.back_female = sprites['back_female']
    db_sprites.back_shiny = sprites['back_shiny']
    db_sprites.back_shiny_female = sprites['back_shiny_female']
    db_sprites.front_default = sprites['front_default']
    db_sprites.front_female = sprites['front_female']
    db_sprites.front_shiny = sprites['front_shiny']
    db_sprites.front_shiny_female = sprites['front_shiny_female']
    db_sprites.official_artwork_front_default = sprites['other']['official-artwork']['front_default']

    db_pokemon.sprite = db_sprites

    # save sprites
    db_sprites.save
  end

  def add_stats(stats, db_pokemon)
    # process stats if any
    return unless stats.size.positive?

    # cycle through all stats and add them to the db if missing
    stats.each do |stat|
      stat_name = stat['stat']['name']
      db_stat = Stat.find_by_name(stat_name)
      unless db_stat
        db_stat = Stat.new
        db_stat.name = stat_name
        db_stat.url = stat['stat']['url']
      end

      pokemon_stat = PokemonsStat.new
      pokemon_stat.pokemon = db_pokemon
      pokemon_stat.base_stat = stat['base_stat']

      # relate it to the pokemon_stat join
      pokemon_stat.stat = db_stat

      # save stat
      pokemon_stat.save
    end
  end

  def add_types(types, db_pokemon)
    # process types if any
    return unless types.size.positive?

    # cycle through all types and add them to the db if missing
    types.each do |type|
      type_name = type['type']['name']
      db_type = Type.find_by_name(type_name)
      unless db_type
        db_type = Type.new
        db_type.name = type_name
        db_type.url = type['type']['url']
      end

      pokemon_type = PokemonsType.new
      pokemon_type.pokemon = db_pokemon
      pokemon_type.slot = type['slot']

      # relate it to the pokemon_type join
      pokemon_type.type = db_type

      # save stat
      pokemon_type.save
    end
  end

  def base_pokemon(pokemon)
    db_pokemon = Pokemon.find_by_name(pokemon['name'])

    unless db_pokemon
      db_pokemon = Pokemon.new

      # fill pokemon base information
      db_pokemon.base_experience = pokemon['base_experience']
      db_pokemon.height = pokemon['height']
      db_pokemon.pokeapi_id = pokemon['id']
      db_pokemon.is_default = pokemon['is_default']
      db_pokemon.name = pokemon['name']
      db_pokemon.order = pokemon['order']
      db_pokemon.weight = pokemon['weight']
    end

    db_pokemon
  end

  def process_sublist(sublist)
    sublist.each do |pokemon_handle|
      pokemon_path = pokemon_handle['url']
      @list.append(self.class.get(pokemon_path))

      pokemon = @list.last

      db_pokemon = base_pokemon(pokemon)

      # p 'pokemon-----------------------------'
      # p db_pokemon
      # p '------------------------------------'

      set_species(pokemon['species'], db_pokemon)
      set_sprites(pokemon['sprites'], db_pokemon)
      add_abilities(pokemon['abilities'], db_pokemon)
      add_forms(pokemon['forms'], db_pokemon)
      add_held_items(pokemon['held_items'], db_pokemon)
      add_moves(pokemon['moves'], db_pokemon)
      add_stats(pokemon['stats'], db_pokemon)
      add_types(pokemon['types'], db_pokemon)

      db_pokemon.save

      # p '--------------------------------------'
      # p db_pokemon.stats
      # p '--------------------------------------'
    end
  end

  def pokemons
    # get pokemon list count
    count = self.class.get(POKEMON_SERVICE_PROBE)['count']

    offset = 0

    # get pokemon urls
    while offset <= count # && offset < POKEMON_SERVICE_FETCH_LIMIT
      path = "#{POKEMON_SERVICE_FETCH}#{offset}"
      # p path

      # get partial list of pokemons
      sublist = self.class.get(path)['results']

      process_sublist(sublist)

      offset += POKEMON_SERVICE_FETCH_LIMIT
    end
  end
  # @list
end
