class MonthlyReportJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      if user.report_frequency == 'monthly'
        eaten_products = user.eaten_products.where(eaten_at: Date.yesterday.all_month)
        MonthlyReportMailer.with(
          user: user,
          eaten_products: eaten_products
        ).monthly_report.deliver_now
      end
    end
  end
end
