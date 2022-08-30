class EatenProductMeal < ApplicationRecord
  belongs_to :eaten_product
  belongs_to :meal
end
