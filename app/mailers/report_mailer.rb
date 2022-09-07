class ReportMailer < ApplicationMailer
  def send_report
    @user = params[:user]
    @eaten_product = params[:eaten_product]

    mail(
      to: User.first.email,
      subject: "Report for #{@eaten_product.format_date}"
    )
  end
end