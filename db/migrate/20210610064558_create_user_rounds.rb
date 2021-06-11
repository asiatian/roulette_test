class CreateUserRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rounds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :round, null: false, foreign_key: true
      t.integer :color
      t.decimal :amount, precision: 19, scale: 2

      t.timestamps
    end
    add_index :user_rounds, :color
  end
end
