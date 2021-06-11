class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.integer :color

      t.timestamps
    end
    add_index :rounds, :color
  end
end
