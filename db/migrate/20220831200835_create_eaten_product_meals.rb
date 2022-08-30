class CreateEatenProductMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :eaten_product_meals do |t|
      t.belongs_to :eaten_product, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end
    add_index :eaten_product_meals, [:eaten_product_id, :meal_id], unique: true
  end
end
