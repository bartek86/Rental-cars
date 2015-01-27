class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :comfort
      t.integer :fare

      t.timestamps null: false
    end
  end
end
