class MonthlyReportMailer < ApplicationMailer
  def monthly_report
    @user = params[:user]
    @eaten_products = params[:eaten_products]

    mail(
      to: @user.email,
      subject: "Monthly report from #{(Date.today - 1).all_month.first.strftime('%d-%m-%Y')} to
      #{(Date.today - 1).all_month.last.strftime('%d-%m-%Y')}"
    )
  end
end