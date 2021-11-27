module Environment

end

class Depot
	attr_accessor :packs

	def initialize
		@packs = {
			:simple_transportation_pack => {
				:intelligence => 		[:cellphone],
				:items => 					[:mediapack, :chevy_versa]
			},
			:standard_transportation_pack => {
				:intelligence => 		[:cellphone, :antenna],
				:arsenal => 				[:colt_1911],
				:items => 					[:handcuffs, :medipack, :chemistry, :chevy_versa]
			},
			:simple_mission_pack => {
				:intelligence => 		[:infopack, :laptop, :cellphone, :antenna],
				:arsenal => 					[:colt_1911],
				:items => 						[:handcuffs, :medipack, :chemistry, :financial]
			},
			:standard_mission_pack => {
				:intelligence => 		[:infopack, :laptop, :cellphone, :antenna],
				:arsenal => 					[:remington_870, :colt_1911, :machete, :hatchet],
				:items => 						[:handcuffs, :medipack, :chemistry, :financial]
			}
		}
	end
	
end

class Control
	attr_accessor :missions

	STATES = %w(paused aborted failed accomplished)

	STATES.each do |state|
		define_method("set_mission_to_#{state}") do |mission|
			@missions[mission][:status] = state.to_sym
		end
	end

	def initialize
		@missions = {}

		#add methods for setting status

	end

	def new_mission( name:, objective:, pack: )
		@missions[name] = {:objective => objective, :pack => pack, :status => :active}
	end
end

class Human
	attr_accessor :id, :name, :personal_data, :professional_data

	def initialize
		@personal_data = {
			:surname => "",
			:age => 0,
			:country => "",
			:language => "",
			:marital_status => "",
			:children => 0
		}

		@professional_data = {
			:position => "",
			:occupation => "",
			:skills => "",
			:observations => ""
		}
	end

	define_method("set_personal_data") do |surname: , age:, country:, language:, marital_status:, children: |
		@personal_data[:surname] = surname
		@personal_data[:age] = age
		@personal_data[:country] = country
		@personal_data[:language] = language
		@personal_data[:marital_status] = marital_status
		@personal_data[:children] = country
	end

	define_method("set_professional_data") do |position:, occupation:, skills:, observations:|
		@professional_data[:position] = position
		@professional_data[:occupation] = occupation
		@professional_data[:skill] = skills
		@professional_data[:observations] = observations
	end


	class Worker < Human
		attr_accessor :standard_shift, :extra_shift

		def initialize
			super
			@standard_shift = {
				:id 				=> object_id,
				:hours 			=> 8,
				:payment		=> 8,
				:facility 	=> String.new,
				:status 		=> nil
			}

			@extra_shift = {
				:id 				=> object_id,
				:hours 			=> Integer.new,
				:payment		=> Float.new,
				:facility 	=> String.new,
				:status 		=> nil
			}
		end

	end
end

# depot = Depot.new
# control = Control.new
#
# p depot.packs[:simple_transportation_pack]
# p depot.packs[:standard_mission_pack]
# p depot.packs[:standard_mission_pack][:items]
#
# name = :alpha and objective = 'Get Alpha to the base' and pack = :simple_transportation_pack
# control.new_mission name: name, objective: objective, pack: depot.packs[pack]
# p control.missions[:alpha]