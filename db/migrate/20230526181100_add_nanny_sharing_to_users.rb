class AddNannySharingToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :nanny_sharing, :boolean
  end
end
