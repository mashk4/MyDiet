class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :calories
      t.integer :sugar
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrates

      t.timestamps
    end

    add_index :meals, :name, unique: true
  end
end
