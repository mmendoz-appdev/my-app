class CreateParentInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :parent_interests do |t|
      t.integer :interest_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
