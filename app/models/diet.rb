class Diet < ApplicationRecord
  belongs_to :user

  has_many :diet_meals, dependent: :destroy
  has_many :meals, through: :diet_meals

  validates :date, presence: true

  validate :correct_date
  # validate :date_is_taken

  def format_date
    date.strftime('%d-%m-%Y')
  end

  def self.search(date)
    diet = Diet.find_by(date: date || Date.today)
    where(id: diet)
  end

  private

  def correct_date
    return if date >= Date.today

    errors.add(:date, 'is in the past.')
  end

  # TODO: fix this and above validation
  # def date_is_taken
  #   return if date

  #   errors.add(:date, 'is taken. You already have a diet for this date.') if Diet.find_by(date: date)
  # end
end
