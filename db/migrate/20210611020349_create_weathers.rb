class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.date :date
      t.float :temperature

      t.timestamps
    end
    add_index :weathers, :date, unique: true
  end
end
