class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :caption
      t.text :text
      t.integer :owner_id
      t.string :location
      t.integer :group_id
      t.integer :likes_count
      t.integer :comments_count

      t.timestamps
    end
  end
end
