class AddParentIdToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :parent_id, :integer
  end
end
