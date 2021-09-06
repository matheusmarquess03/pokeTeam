class Team < ApplicationRecord
  belongs_to :trainer
  has_many :pokemons, dependent: :delete_all

  validates :name, presence: true
end
