class Diet < ApplicationRecord
  include Authorship

  belongs_to :user

  has_many :diet_meals, dependent: :destroy
  has_many :meals, through: :diet_meals

  validates :date, presence: true, uniqueness: { scope: :user_id }
  validate :date_is_in_the_past, if: :date_changed?

  scope :search_by_day, ->(date) do
    diet = Diet.find_by(date: date || Date.today)
    where(id: diet)
  end

  def format_date
    date.strftime('%d-%m-%Y')
  end

  private

  def date_is_in_the_past
    errors.add(:date, 'is in the past.') if date.present? && date < Date.today
  end
end
