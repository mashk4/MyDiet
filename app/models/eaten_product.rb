class EatenProduct < ApplicationRecord
  belongs_to :user

  has_many :eaten_product_meals, dependent: :destroy
  has_many :meals, through: :eaten_product_meals

  scope :search_by_day, ->(eaten_at) do
    eaten_products_list = EatenProduct.find_by(eaten_at: eaten_at || Date.today)
    where(id: eaten_products_list)
  end

  def format_date
    eaten_at.strftime('%d-%m-%Y')
  end
end
