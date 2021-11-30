require '../environment.rb'
require 'rspec'

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
