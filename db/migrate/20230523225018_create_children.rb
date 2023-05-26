class CreateChildren < ActiveRecord::Migration[6.0]
  def change
    create_table :children do |t|
      t.integer :age
      t.string :first_name
      t.string :gender

      t.timestamps
    end
  end
end
