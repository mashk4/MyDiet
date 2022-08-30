require 'uri'
require 'httparty'
require 'json'

meals = []

File.readlines('db/data_source/basic_meals.txt').each { |line| meals << line }

meals.each do |meal|
  begin
  url = "https://api.calorieninjas.com/v1/nutrition?query=#{meal}"

  response = HTTParty.get(
    url,
    headers: {
      'X-Api-Key': 'xYNwwyjGioi7aKeNYsCkjw==BAy4qUVnYmrmUREN'
      }
    )

  doc = JSON.parse(response.body)

  doc['items'].each do |doc_meal|
    Meal.create(
      name: doc_meal['name'],
      calories: doc_meal['calories'],
      sugar: doc_meal['sugar_g'],
      protein: doc_meal['protein_g'],
      fat: doc_meal['fat_total_g'],
      carbohydrates: doc_meal['carbohydrates_total_g']
    )
  end
  rescue ActiveRecord::RecordNotUnique
    next
  end
end