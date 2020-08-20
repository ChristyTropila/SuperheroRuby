class RemoveUserIdFromSuperheros < ActiveRecord::Migration[5.2]
  def change
    remove_column :superheros, :user_id, :integer
  end
end
