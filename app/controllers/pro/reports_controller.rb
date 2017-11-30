class Pro::ReportsController < ApplicationController

  def index
    @user = current_user
    @reports = Booking.where(user_id: 3).map do |booking| booking.report end
  end

  def show
    @report = Report.find(params[:id])
    @sections = Section.all
    @booking =@report.booking
    @user = current_user
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",   # Excluding ".pdf" extension.
        template: "pro/reports/show.html.erb",
        layout: 'pdf.html'
      end
    end
  end

end
