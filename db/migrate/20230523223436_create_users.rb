class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :zipcode
      t.text :bio
      t.string :occupation
      t.string :religion
      t.boolean :military_spouse
      t.boolean :special_needs_parent
      t.string :nationality_1
      t.string :nationality_2
      t.string :language_1
      t.string :language_2
      t.string :language_3
      t.string :profile_picture
      t.integer :sent_follow_requests_count
      t.integer :received_follow_requests_count
      t.integer :own_photos_count
      t.integer :memberships_count
      t.integer :children_count

      t.timestamps
    end
  end
end
