class DailyReportJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      eaten_product =  user.eaten_products.find_by(eaten_at: Date.today)
      if eaten_product && user.report_frequency == 'daily'
        previous_eaten_product = user.eaten_products.find_by(eaten_at: Date.yesterday)
        DailyReportMailer.with(
          user: user,
          eaten_product: eaten_product,
          previous_eaten_product: previous_eaten_product
        ).daily_report.deliver_now
      end
    end
  end
end
