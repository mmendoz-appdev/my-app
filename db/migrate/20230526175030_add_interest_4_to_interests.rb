class AddInterest4ToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :interest_4, :boolean
  end
end
