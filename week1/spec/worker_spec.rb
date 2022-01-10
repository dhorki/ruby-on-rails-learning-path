require '../environment.rb'
require 'rspec'

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
