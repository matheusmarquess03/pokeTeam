require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let!(:pokemon) { build(:pokemon) }

  it 'should create a pokemon' do
    expect do
      create(:pokemon)
    end.to change(Pokemon, :count).by(1)
  end

  context 'Validates' do
    it 'is not valid without name' do
      pokemon = build(:pokemon, name: nil)
      pokemon.valid?
      expect(pokemon).to be_invalid
    end
  end
end
