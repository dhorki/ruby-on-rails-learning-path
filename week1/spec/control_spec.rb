require '../environment.rb'
require 'rspec'

RSpec.describe Environment::Control do

  it 'stores new missions correctly, including name, objective and pack' do
    subject.new_mission name: :alpha, objective: 'Get Alpha to the base', pack: :simple_transportation_pack
    missions = subject.missions

    # @control.missions.keys must caontain [:alpha]
    expect(missions.keys).to include(:alpha)

    # @control.missions[:alpha][:status] must be :active
    expect(missions[:alpha][:status]).to eq(:active)

    # @control.missions[:alpha][:objective] must be equal to 'Get Alpha to the base'
    expect(missions[:alpha][:objective]).to eq('Get Alpha to the base')

    # @control.missions[:alpha][:pack] must be :simple_transportation_pack
    expect(missions[:alpha][:pack]).to eq(:simple_transportation_pack)
  end

  it 'has methods to change the status (#set_mission_to_paused, #set_mission_to_aborted, #set_mission_to_failed, #set_mission_to_accomplished)' do
    # @control.respond_to?(:set_mission_to_paused) must be true
    expect(subject).to respond_to(:set_mission_to_paused)

    # @control.respond_to?(:set_mission_to_aborted) must be true
    expect(subject).to respond_to(:set_mission_to_aborted)

    # @control.respond_to?(:set_mission_to_failed) must be true
    expect(subject).to respond_to(:set_mission_to_failed)

    # @control.respond_to?(:set_mission_to_accomplished) must be true
    expect(subject).to respond_to(:set_mission_to_accomplished)
  end

end
