class CreateDietMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :diet_meals do |t|
      t.belongs_to :diet, null: false, foreign_key: true
      t.belongs_to :meal, null: false, foreign_key: true

      t.timestamps
    end

    add_index :diet_meals, [:diet_id, :meal_id], unique: true
  end
end
