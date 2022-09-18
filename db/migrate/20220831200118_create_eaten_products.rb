class CreateEatenProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :eaten_products do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.date :eaten_at

      t.timestamps
    end
    add_index :eaten_products, %i[user_id eaten_at], unique: true
  end
end
