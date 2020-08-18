class AddUserToSuperheros < ActiveRecord::Migration[5.2]
  def change
    add_column :superheros, :user_id, :integer
  end
end
