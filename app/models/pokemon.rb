class Pokemon < ApplicationRecord
    belongs_to :team
    #validates :name, presence: true
  
    before_save :verify_quantity_team
  
    private
      def verify_quantity_team
        if self.team.pokemons.count > 6
          errors[:base] << I18n.t(:maximum_pokemon_team, scope: 'activerecord.errors.models.pokemon')
        end
      end
end
