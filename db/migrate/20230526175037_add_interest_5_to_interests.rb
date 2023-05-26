class AddInterest5ToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :interest_5, :boolean
  end
end
