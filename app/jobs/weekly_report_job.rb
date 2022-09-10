class WeeklyReportJob < ApplicationJob
  queue_as :default

  def perform
    if Date.today.sunday?
      User.find_each do |user|
        if user.report_frequency == 'weekly'
          WeeklyReportMailer.with(user: user, eaten_products: user.eaten_products
          .where(eaten_at: Date.today - 6..Date.today)).weekly_report.deliver_now
        end
      end
    end
  end
end

