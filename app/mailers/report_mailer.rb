class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.report_complete.subject
  #
  def report_complete(report)
    @report = report
    @user = @report.booking.user
    mail to: @user.email, subject: 'Votre rapport de #{@report.booking.product.label} de votre chantier à #{@report.booking.address.city}'
  end
end
