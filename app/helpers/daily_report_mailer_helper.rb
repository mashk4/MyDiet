module DailyReportMailerHelper
  def calculate_calories
    @eaten_product.meals.sum(&:calories) - @previous_eaten_product.meals.sum(&:calories)
  end

  def calculate_calories_percentage
    0 if calculate_calories.zero?

    if calculate_calories.positive?
      (calculate_calories.to_f / previous_eaten_product.meals.sum(&:calories)).round(2) * 100
    else
      (calculate_calories.abs.to_f / @previous_eaten_product.meals.sum(&:calories)).round(2) * 100
    end
  end
end