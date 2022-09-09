module EatenProductsHelper
  def total_stats(nutrients, object)
    stats = { 'calories' => 0,
              'sugar' => 0,
              'protein' => 0,
              'fat' => 0,
              'carbohydrates' => 0 }

    object.includes(:eaten_product_meals, :meals).each do |object|
      nutrients.each do |el|
        stats[el] += object.meals.sum(&el.to_sym)
      end
    end

    stats
  end
end
