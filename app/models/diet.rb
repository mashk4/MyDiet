class Diet < ApplicationRecord
  include Authorship

  belongs_to :user

  has_many :diet_meals, dependent: :destroy
  has_many :meals, through: :diet_meals

  validates :date, presence: true

  validate :correct_date

  scope :search_by_day, ->(date) do
    diet = Diet.find_by(date: date || Date.today)
    where(id: diet)
  end

  def format_date
    date.strftime('%d-%m-%Y')
  end

  private

  def correct_date
    return if date >= Date.today

    errors.add(:date, 'is in the past.')
  end
end
