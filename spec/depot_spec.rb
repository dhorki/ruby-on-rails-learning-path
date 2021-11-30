require '../environment.rb'
require 'rspec'

RSpec.describe Environment::Depot do
  let(:depot) { described_class.new }

  describe 'simple transportation pack' do
    let(:pack) { depot.packs[:simple_transportation_pack] }

    # @depot.packs[:simple_transportation_pack][:intelligence] must contain [:cellphone]
    it 'includes a cellphone as intelligence' do
      expect(pack[:intelligence]).to include(:cellphone)
    end

    # @depot.packs[:simple_transportation_pack][:items] must contain [:medipack, :chevy_versa]
    it 'includes a medipack and chevy versa as items' do
      expect(pack[:items]).to include(:medipack, :chevy_versa)
    end
  end

  describe 'standard transportation pack' do
    let(:pack) { depot.packs[:standard_transportation_pack] }

    # @depot.packs[:standard_transportation_pack][:intelligence] must contain [:cellphone, :antenna]
    it 'includes a cellphone and antenna as intelligence' do
      expect(pack[:intelligence]).to include(:cellphone, :antenna)
    end

    # @depot.packs[:standard_transportation_pack][:arsenal] must contain [:colt_1911]
    it 'includes a colt 1911 as arsenal' do
      expect(pack[:arsenal]).to include(:colt_1911)
    end

    # @depot.packs[:standard_transportation_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :chevy_versa]
    it 'includes handcuffs, medipack, chemistry, chevy_versa as items' do
      expect(pack[:items]).to include(:handcuffs, :medipack, :chemistry ,:chevy_versa)
    end
  end

  describe 'simple mission pack' do
    let(:pack) { depot.packs[:simple_mission_pack] }

    # @depot.packs[:simple_mission_pack][:intelligence] must contain [:infopack, :laptop, :cellphone, :antenna]
    it 'includes an infopack, laptop, cellphone and antenna as intelligence' do
      expect(pack[:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
    end

    # @depot.packs[:simple_mission_pack][:arsenal] must contain [:colt_1911]
    it 'includes a colt 1911 as arsenal' do
      expect(pack[:arsenal]).to include(:colt_1911)
    end

    # @depot.packs[:simple_mission_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :financial]
    it 'includes handcuffs, medipack, chemistry, chevy_versa as items' do
      expect(pack[:items]).to include(:handcuffs, :medipack, :chemistry ,:financial)
    end
  end

  describe 'simple mission pack' do
    let(:pack) { depot.packs[:standard_mission_pack] }

    # @depot.packs[:standard_mission_pack][:intelligence] must contain [:infopack, :laptop, :cellphone, :antenna]
    it 'includes an infopack, laptop, cellphone and antenna as intelligence' do
      expect(pack[:intelligence]).to include(:infopack, :laptop, :cellphone, :antenna)
    end

    # @depot.packs[:standard_mission_pack][:arsenal] must contain [:remington_870, :colt_1911, :machete, :hatchet]
    it 'includes a colt 1911 as arsenal' do
      expect(pack[:arsenal]).to include(:remington_870, :colt_1911, :machete, :hatchet)
    end

    # @depot.packs[:standard_mission_pack][:items] must contain [:handcuffs, :medipack, :chemistry, :financial]
    it 'includes handcuffs, medipack, chemistry, chevy_versa as items' do
      expect(pack[:items]).to include(:handcuffs, :medipack, :chemistry ,:financial)
    end
  end

end
