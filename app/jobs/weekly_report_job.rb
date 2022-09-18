class WeeklyReportJob < ApplicationJob
  queue_as :default

  def perform
    if Date.today.sunday?
      User.find_each do |user|
        if user.report_frequency == 'weekly'
          eaten_products = user.eaten_products.where(eaten_at: Date.all_week)
          WeeklyReportMailer.with(
            user: user,
            eaten_products: eaten_products
          ).weekly_report.deliver_now
        end
      end
    end
  end
end
