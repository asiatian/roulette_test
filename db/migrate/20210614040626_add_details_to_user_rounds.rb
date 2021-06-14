class AddDetailsToUserRounds < ActiveRecord::Migration[6.1]
  def change
    add_column :user_rounds, :bet, :decimal, precision: 19, scale: 2
    add_column :user_rounds, :percentage, :decimal, precision: 4, scale: 2
  end
end
