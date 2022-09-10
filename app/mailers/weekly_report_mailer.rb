class WeeklyReportMailer < ApplicationMailer
  def weekly_report
    @user = params[:user]
    @eaten_products = params[:eaten_products]

    mail(
      to: @user.email,
      subject: "Weekly report from #{(Date.today - 6).strftime('%d-%m-%Y')} to
      #{Date.today.strftime('%d-%m-%Y')}"
    )
  end
end