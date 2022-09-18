class ReportJob < ApplicationJob
  queue_as :default

  def perform(eaten_product, user)
    ReportMailer.with(
      user: user,
      eaten_product: eaten_product).send_report.deliver_now
  end
end
