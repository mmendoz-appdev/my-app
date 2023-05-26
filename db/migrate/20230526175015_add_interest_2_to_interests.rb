class AddInterest2ToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :interest_2, :boolean
  end
end
