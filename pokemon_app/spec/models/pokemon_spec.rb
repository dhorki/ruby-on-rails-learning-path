# frozen_string_literal: true

require 'pp'

RSpec.describe Pokemon do
  it 'can be instantiated' do
    expect(subject).not_to be_nil
  end

  it 'has default values' do
    expect(subject.base_experience).to eq(0)
    expect(subject.height).to eq(0)
    expect(subject.pokeapi_id).to eq(0)
    expect(subject.is_default).to eq(false)
    expect(subject.name).to eq('')
    expect(subject.order).to eq(0)
    expect(subject.weight).to eq(0)
    expect(subject.species_id).to eq(0)
    expect(subject.is_custom).to eq(false)
  end

  it 'can get values in its attributes' do
    values = {
      base_experience: 300,
      height: 10,
      pokeapi_id: 20,
      is_default: true,
      name: 'test pokemon',
      order: 1,
      weight: 20,
      species_id: 14,
      is_custom: true
    }
    subject.base_experience = values[:base_experience]
    subject.height = values[:height]
    subject.pokeapi_id = values[:pokeapi_id]
    subject.is_default = values[:is_default]
    subject.name = values[:name]
    subject.order = values[:order]
    subject.weight = values[:weight]
    subject.species_id = values[:species_id]
    subject.is_custom = values[:is_custom]

    expect(subject.base_experience).to eq(values[:base_experience])
    expect(subject.height).to eq(values[:height])
    expect(subject.pokeapi_id).to eq(values[:pokeapi_id])
    expect(subject.is_default).to eq(values[:is_default])
    expect(subject.name).to eq(values[:name])
    expect(subject.order).to eq(values[:order])
    expect(subject.weight).to eq(values[:weight])
    expect(subject.species_id).to eq(values[:species_id])
    expect(subject.is_custom).to eq(values[:is_custom])
  end

  it 'cannot be saved wihtout filling information' do
    expect(subject.new_record?).to be(true)
    expect(subject.save).to be(false)
    expect(subject.new_record?).to be(true)
    # puts subject.errors.full_messages.inspect.to_yaml
  end

  it 'can be saved with name, order greater than 0 and an existing species' do
    # create species
    species = Species.new
    species.name = 'test species'
    species.save

    values = {
      base_experience: 300,
      height: 10,
      pokeapi_id: 20,
      is_default: true,
      name: 'test pokemon',
      order: 1,
      weight: 20,
      species: species,
      is_custom: true
    }

    expect(subject.new_record?).to be(true)

    subject.base_experience = values[:base_experience]
    subject.height = values[:height]
    subject.pokeapi_id = values[:pokeapi_id]
    subject.is_default = values[:is_default]
    subject.name = values[:name]
    subject.order = values[:order]
    subject.weight = values[:weight]
    subject.species = values[:species]
    subject.is_custom = values[:is_custom]

    puts subject.valid?

    expect(subject.save).to be(true), subject.errors.full_messages.inspect.to_yaml
    # puts subject.errors.full_messages.inspect.to_yaml
    expect(subject.new_record?).to be(false)

    saved_subject = Pokemon.find(subject.id)

    puts saved_subject.inspect.to_yaml

    expect(saved_subject.base_experience).to eq(values[:base_experience])
    expect(saved_subject.height).to eq(values[:height])
    expect(saved_subject.pokeapi_id).to eq(values[:pokeapi_id])
    expect(saved_subject.is_default).to eq(values[:is_default])
    expect(saved_subject.name).to eq(values[:name])
    expect(saved_subject.order).to eq(values[:order])
    expect(saved_subject.weight).to eq(values[:weight])
    expect(saved_subject.species).to eq(values[:species])
    expect(saved_subject.is_custom).to eq(values[:is_custom])
  end
end
