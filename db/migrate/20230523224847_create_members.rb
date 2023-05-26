class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.integer :group_id
      t.integer :member_id

      t.timestamps
    end
  end
end
