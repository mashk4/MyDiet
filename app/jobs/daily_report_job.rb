class DailyReportJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      if user.eaten_products.find_by(eaten_at: Date.today) && user.report_frequency == 'daily'
        DailyReportMailer.with(user: user, eaten_product: user.eaten_products
        .find_by(eaten_at: Date.today), previous_eaten_product: user.eaten_products
        .find_by(eaten_at: Date.today - 1)).daily_report.deliver_now
      end
    end
  end
end