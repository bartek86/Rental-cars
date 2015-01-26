class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :client
      t.date :from_date
      t.date :to_date
      t.references :car, index: true

      t.timestamps null: false
    end
    add_foreign_key :rents, :cars
  end
end
