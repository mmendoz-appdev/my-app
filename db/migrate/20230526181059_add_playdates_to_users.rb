class AddPlaydatesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :playdates, :boolean
  end
end
