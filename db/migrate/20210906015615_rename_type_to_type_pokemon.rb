class RenameTypeToTypePokemon < ActiveRecord::Migration[5.2]
  def change
    rename_column :pokemons, :type, :type_pokemon
  end
end
