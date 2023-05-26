class AddSupportToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :support, :boolean
  end
end
