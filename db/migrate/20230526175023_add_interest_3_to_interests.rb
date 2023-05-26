class AddInterest3ToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :interest_3, :boolean
  end
end
