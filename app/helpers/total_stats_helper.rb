module TotalStatsHelper
  def total_stats(nutrients, eaten_products)
    stats = { 'calories' => 0,
              'sugar' => 0,
              'protein' => 0,
              'fat' => 0,
              'carbohydrates' => 0 }

    eaten_products.includes(:eaten_product_meals, :meals).each do |product|
      nutrients.each do |el|
        stats[el] += product.meals.sum(&el.to_sym)
      end
    end

    stats
  end
end
