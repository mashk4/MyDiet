class CreateDiets < ActiveRecord::Migration[7.0]
  def change
    create_table :diets do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
    add_index :diets, [:user_id, :date], unique: true
  end
end
