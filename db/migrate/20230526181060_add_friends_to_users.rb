class AddFriendsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :friends, :boolean
  end
end
