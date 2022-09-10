class MonthlyReportJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      if user.report_frequency == 'monthly'
        MonthlyReportMailer.with(user: user, eaten_products: user.eaten_products
        .where(eaten_at: (Date.today - 1).all_month)).monthly_report.deliver_now
      end
    end
  end
end

