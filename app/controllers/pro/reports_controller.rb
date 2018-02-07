class Pro::ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Booking.where(user_id: @user).map do |booking| booking.report end.sort_by(&:created_at)
  end

  def show
    @report = Report.find(params[:id])
    @booking =@report.booking
    @client = @booking.user
    @tech = @booking.availabilities.first.user
    @report = Report.find(params[:id])
    @sections = Section.all
    @user = current_user
    respond_to do |format|
      format.html
      format.pdf do
        render pdf:                     "Votre Rapport",   # Excluding ".pdf" extension.
        template:                       "shared/_report.html.erb",
        page_size:                      'A4',
        save_only:                      false,
        background:                     false,                     # backround needs to be true to enable background colors to render
        no_background:                  true,
        encoding:                       'UTF-8'
      end
    end
  end

end
