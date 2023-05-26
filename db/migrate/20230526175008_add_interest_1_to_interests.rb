class AddInterest1ToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :interest_1, :boolean
  end
end
