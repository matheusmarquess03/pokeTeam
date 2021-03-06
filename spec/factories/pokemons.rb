FactoryBot.define do
  factory :pokemon do
    name { 'ditto' }
    sprite_url { 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png' }
    type_pokemon { 'normal' }
    team { build(:team) }
  end
end
