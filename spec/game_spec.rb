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

RSpec.describe Environment::Human do

  it 'is created with a Name and its id is not nil' do
    human = described_class.new name: 'Diego'

    # @human.name must be { :name => 'Diego' }
    expect(human).to have_attributes(name: 'Diego')

    # @human.id must not be nil
    expect(human).not_to be_nil
  end

  it 'responds to #set_personal_data and #set_professional_data' do
    human = described_class.new name: ''

    # @human.respond_to?(:set_personal_data) must be true
    expect(human).to respond_to(:set_personal_data)

    # @human.respond_to?(:set_professional_data) must be true
    expect(human).to respond_to(:set_professional_data)
  end

end


RSpec.describe Environment::Worker do
  let(:worker) { described_class.new 'Juan' }

  describe 'personal data' do
    let(:personal_data) { worker.personal_data }

    it 'stores surname, age, marital status, children, country and language correctly when set (#set_personal_data)' do
      worker.set_personal_data surname: 'Silva', age: 40, marital_status: :single, children: 0, country: :mx, language: :es

      # expect(@worker.personal_data[:surname] must be 'Silva'
      expect(personal_data[:surname]).to eq('Silva')

      # expect(@worker.personal_data[:age] must be 40
      expect(personal_data[:age]).to eq(40)

      # expect(@worker.personal_data[:marital_status] must be :single
      expect(personal_data[:marital_status]).to eq(:single)

      # expect(@worker.personal_data[:children] must be 0
      expect(personal_data[:children]).to eq(0)

      # expect(@worker.personal_data[:country] must be :mx
      expect(personal_data[:country]).to eq (:mx)

      # expect(@worker.personal_data[:language] must be :es
      expect(personal_data[:language]).to eq(:es)
    end
  end

  describe 'professional data' do
    let(:professional_data) { worker.professional_data }

    it 'stores position, occupation, skills and observations when set (#set_professiona_data)' do
      worker.set_professional_data position: 'SE', occupation: 'IT', skills: [:ruby, :blender], observations: 'none'

      # expect(@worker.professional_data[:position] must be 'SE'
      expect(professional_data[:position]).to eq('SE')

      # expect(@worker.professional_data[:occupation] must be 'IT'
      expect(professional_data[:occupation]).to eq('IT')

      # expect(@worker.professional_data[:skills] must content [:ruby, :blender]
      expect(professional_data[:skills]).to include(:ruby, :blender)

      # expect(@worker.professional_data[:observations] must be 'none'
      expect(professional_data[:observations]).to eq('none')
    end
  end


end


RSpec.describe Environment::Dictionary do
  let(:expressions) { described_class.new.expressions }

  it 'has translations for :hello expression' do
    translation_set = expressions[:hello]

    # @dictionary.expressions[:hello][:en] must be 'hello'
    expect(translation_set[:en]).to eq('hello')

    # @dictionary.expressions[:hello][:es] must be 'hola'
    expect(translation_set[:es]).to eq('hola')

    # @dictionary.expressions[:hello][:cz] must be 'ahoj'
    expect(translation_set[:cz]).to eq('ahoj')
  end

  it 'has translations for :goodbye expression' do
    translation_set = expressions[:goodbye]

    # @dictionary.expressions[:goodbye][:en] must be 'goodbye'
    expect(translation_set[:en]).to eq('goodbye')

    # @dictionary.expressions[:goodbye][:es] must be 'adios'
    expect(translation_set[:es]).to eq('adios')

    # @dictionary.expressions[:goodbye][:cz] must be 'nashledanou'
    expect(translation_set[:cz]).to eq('nashledanou')
  end

  it 'has translations for :my_name_is expression' do
    translation_set = expressions[:my_name_is]

    # @dictionary.expressions[:my_name_is][:en] must be 'my name is'
    expect(translation_set[:en]).to eq('my name is')

    # @dictionary.expressions[:my_name_is][:es] must be 'mi nombre es'
    expect(translation_set[:es]).to eq('mi nombre es')

    # @dictionary.expressions[:my_name_is][:cz] must be 'jmenuju se'
    expect(translation_set[:cz]).to eq('jmenuju se')
  end

  it 'has translations for :i_come_from expression' do
    translation_set = expressions[:i_come_from]

    # @dictionary.expressions[:i_come_from][:en] must be 'i come from'
    expect(translation_set[:en]).to eq('i come from')

    # @dictionary.expressions[:i_come_from][:es] must be 'yo vengo de'
    expect(translation_set[:es]).to eq('yo vengo de')

    # @dictionary.expressions[:i_come_from][:cz] must be 'ja odchazim od'
    expect(translation_set[:cz]).to eq('ja odchazim od')
  end

end
