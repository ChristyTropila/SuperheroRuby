class CreateSuperheroesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.integer :superpower_id
      t.integer :organization_id
    end
  end
end
