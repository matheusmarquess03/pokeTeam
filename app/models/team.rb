class Team < ApplicationRecord
  belongs_to :trainer
  has_many :pokemons, dependent: :delete_all

  accepts_nested_attributes_for :pokemons

  validates :name, presence: true
end
