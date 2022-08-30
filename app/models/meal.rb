class Meal < ApplicationRecord
  has_many :diet_meals, dependent: :destroy
  has_many :diets, through: :diet_meals
  has_many :eaten_product_meals, dependent: :destroy
  has_many :eaten_products, through: :eaten_product_meals

  validates :name, presence: true, uniqueness: true
end
