module DailyReportMailerHelper
  def calculate_calories_percentage
    return 0 if calculate_calories.zero?

    if calculate_calories.positive?
      ((calculate_calories.to_f / previous_eaten_sum_calories) * 100).round(2)
    else
      ((calculate_calories.abs.to_f / previous_eaten_sum_calories) * 100).round(2)
    end
  end

  private

  def calculate_calories
    @eaten_product.meals.sum(&:calories) - sum_calories
  end

  def previous_eaten_sum_calories
    @previous_eaten_product.meals.sum(&:calories)
  end
end