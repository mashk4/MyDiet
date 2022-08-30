class Meal < ApplicationRecord
  has_many :diet_meals, dependent: :destroy
  has_many :diets, through: :diet_meals
end
