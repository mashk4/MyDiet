class DailyReportMailer < ApplicationMailer
  def daily_report
    @user = params[:user]
    @eaten_product = params[:eaten_product]
    @previous_eaten_product = params[:previous_eaten_product]

    mail(
      to: @user.email,
      subject: "Daily report for #{@eaten_product.format_date}"
    )
  end
end