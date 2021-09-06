class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.string :sprite_url
      t.references :team, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
