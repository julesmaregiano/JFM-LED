class Pro::ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Booking.where(user: @user).includes(:report, :user, :address, :product).map do |booking| booking.report end.sort_by(&:created_at)
  end

  def show
    @report = Report.find(params[:id])
    @booking =@report.booking
    @client = @booking.user
    @tech = @booking.availabilities.first.user
    @report = Report.find(params[:id])
    @sections = @booking.product.sections.uniq.sort_by(&:created_at).map do |s| s if s.has_answers?(@report) end.compact.sort_by(&:order)
    @user = current_user
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:                     "#{@report.booking.reference} Rapport de #{@report.booking.product.label}",   # Excluding ".pdf" extension.
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
      end
    end
  end

end
