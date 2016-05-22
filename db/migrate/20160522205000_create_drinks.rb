class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.integer :volume
      t.integer :caffeine
      t.integer :calories

      t.timestamps null: false
    end
  end
end
