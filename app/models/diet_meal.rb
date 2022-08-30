class DietMeal < ApplicationRecord
  belongs_to :diet
  belongs_to :meal
end
