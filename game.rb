require './environment.rb'

class Game

  attr_accessor :board, :depot, :control

  def initialize
    @board = {
      :players => {},
      :control => {},
      :status => nil
    }
    @depot = Environment::Depot.new
    @control = Environment::Control.new

  end

  def new_mission( name:, objective:, pack: )
    @control.new_mission( name: name, objective: objective, pack: pack )
    @board[:control][:missions] = @control.missions
  end

  def new_worker( name: )
    worker = Environment::Worker.new
    worker.name = name
    @board[:players][name] = worker
  end

end

game = Game.new
diego = game.new_worker name: 'Diego'
diego.set_personal_data surname: 'Mota', age: 40, marital_status: :single, children: 0, country: :mx,
                        language: :es
diego.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'

p '------------------------------------------'
puts "#{diego.name}, #{diego.class}", diego.personal_data, diego.professional_data

p '------------------------------------------'
p game.depot.packs[:simple_transportation_pack]
p game.depot.packs[:standard_mission_pack]
p game.depot.packs[:standard_mission_pack][:items]

p '------------------------------------------'
name = :alpha and objective = 'Get Alpha to the base' and pack = :simple_transportation_pack
game.new_mission name: name, objective: objective, pack: game.depot.packs[pack]
p game.control.missions[:alpha]

game.control.set_mission_to_accomplished(:alpha) and puts game.control.missions[:alpha]