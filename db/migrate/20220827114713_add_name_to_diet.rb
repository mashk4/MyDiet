class AddNameToDiet < ActiveRecord::Migration[7.0]
  def change
    add_column :diets, :name, :string, null: false, default: 'Your Diet'
  end
end
