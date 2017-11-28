class Technician::ReportsController < ApplicationController
  before_action :params_user, only: [:index, :show, :edit]
  before_action :params_report, only: [:show, :edit]

  def index
    @reports = @user.reports # car un seul diagnosticien pour l'instant
    @housings = Housing.all
  end

  def show
    @sections = Section.all
    @booking = @report.booking
    draw_marker(@booking.housing)
    if params[:query]
      @plan_id = params[:query][:address]
    end
  end

  def edit
    @booking = @report.booking
    draw_marker(@booking.housing)
    @sections = Section.all
  end

  private

  def params_user
    @user = current_user
  end

  def params_diagnostic
    @report = Report.find(params[:id])
  end
end
