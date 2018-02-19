class Manager::ReportsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit]
  before_action :set_report, only: [:show, :edit]
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_client, only: [:show, :edit, :update]
  before_action :set_tech, only: [:show, :edit, :update]
  before_action :set_sections, only: [:show, :edit, :update]

  def index
    @reports = Report.all.sort_by(&:created_at).map do |r| r if r.booking.availabilities.first.user.branch == @user.branch end.compact # car un seul diagnosticien pour l'instant
  end

  def show
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

  def edit
  end

  def update
    if @report.update(photos_params)
      redirect_to([@user.role, @report])
    else
      render :edit
    end
  end


  private

  def set_user
    @user = current_user
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def photos_params
    params.require(:report).permit(photos:[])
  end

  def set_user
    @user = current_user
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def set_booking
    @booking = @report.booking
  end

  def set_client
    @client = @booking.user
  end

  def set_tech
    @tech = @booking.availabilities.first.user
  end

  def set_sections
    @sections = @booking.product.sections.uniq.sort_by(&:created_at)
  end
end
