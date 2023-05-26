class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :owner_id
      t.boolean :private
      t.integer :members_count

      t.timestamps
    end
  end
end
