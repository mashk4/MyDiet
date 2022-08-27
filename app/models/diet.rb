class Diet < ApplicationRecord
  belongs_to :user

  validate :correct_date
  validate :date_is_not_taken

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

    errors.add(:date, 'is in the past.' )
  end

  def date_is_not_taken
    errors.add(:date, 'is taken. You already have a diet for this date.') if Diet.find_by(date: date)
  end
end
