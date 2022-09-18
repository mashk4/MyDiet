class EatenProduct < ApplicationRecord
  include Authorship

  belongs_to :user

  has_many :eaten_product_meals, dependent: :destroy
  has_many :meals, through: :eaten_product_meals

  scope :search_by_day, ->(eaten_at) do
    eaten_products_list = EatenProduct.find_by(eaten_at: eaten_at || Date.today)
    where(id: eaten_products_list)
  end

  scope :search_by_range, ->(start_date, end_date) do
    EatenProduct.where(eaten_at: start_date..end_date)
  end

  def format_date
    eaten_at.strftime('%d-%m-%Y')
  end
end
