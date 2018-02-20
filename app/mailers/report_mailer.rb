class ReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.report_complete.subject
  #
  def report_complete(report)
    @report = report
    @client = @report.user
    @tech = @report.booking.availabilities.first.user
    @sections = @report.booking.product.sections.uniq.sort_by(&:created_at)


    attachments["report#{report.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string( pdf:                            "#{@report.booking.reference} Rapport de #{@report.booking.product.label}",
                        template:                       "shared/_report.html.erb",
                        page_size:                      'A4',
                        margin:  { top:                 5,                     # default 10 (mm)
                                   bottom:              5,
                                   left:                0,
                                   right:               0 },
                        viewport_size:                  '1280x1024',
                        save_only:                      false,
                        background:                     true,                     # backround needs to be true to enable background colors to render
                        no_background:                  false,
                        encoding:                       'UTF-8'
      )
    )

    mail to: @report.booking.user.email, subject: "Votre rapport de #{@report.booking.product.label} de votre chantier à #{@report.booking.address.city}"
  end
end
