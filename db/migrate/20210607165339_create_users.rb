class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :email
      t.decimal :balance, precision: 19, scale: 2, default: 10000

      t.timestamps
    end
  end
end
