class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :about
      t.string :comfort

      t.timestamps null: false
    end
  end
end