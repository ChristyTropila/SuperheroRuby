class ChangeSuperherosTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :superheroes, :superheros
  end
end
