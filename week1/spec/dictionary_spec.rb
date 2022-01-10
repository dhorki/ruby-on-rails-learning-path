require '../environment.rb'
require 'rspec'

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
