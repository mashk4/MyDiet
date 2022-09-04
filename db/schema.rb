# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_04_152214) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diet_meals", force: :cascade do |t|
    t.bigint "diet_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diet_id", "meal_id"], name: "index_diet_meals_on_diet_id_and_meal_id", unique: true
    t.index ["diet_id"], name: "index_diet_meals_on_diet_id"
    t.index ["meal_id"], name: "index_diet_meals_on_meal_id"
  end

  create_table "diets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "Your Diet", null: false
    t.index ["user_id", "date"], name: "index_diets_on_user_id_and_date", unique: true
    t.index ["user_id"], name: "index_diets_on_user_id"
  end

  create_table "eaten_product_meals", force: :cascade do |t|
    t.bigint "eaten_product_id", null: false
    t.bigint "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eaten_product_id", "meal_id"], name: "index_eaten_product_meals_on_eaten_product_id_and_meal_id", unique: true
    t.index ["eaten_product_id"], name: "index_eaten_product_meals_on_eaten_product_id"
    t.index ["meal_id"], name: "index_eaten_product_meals_on_meal_id"
  end

  create_table "eaten_products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "eaten_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "eaten_at"], name: "index_eaten_products_on_user_id_and_eaten_at", unique: true
    t.index ["user_id"], name: "index_eaten_products_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "calories"
    t.integer "sugar"
    t.integer "protein"
    t.integer "fat"
    t.integer "carbohydrates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_meals_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "diet_meals", "diets"
  add_foreign_key "diet_meals", "meals"
  add_foreign_key "diets", "users"
  add_foreign_key "eaten_product_meals", "eaten_products"
  add_foreign_key "eaten_product_meals", "meals"
  add_foreign_key "eaten_products", "users"
end
