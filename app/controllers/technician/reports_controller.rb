class Technician::ReportsController < ApplicationController
  before_action :params_user, only: [:index, :show, :edit]
  before_action :params_report, only: [:show, :edit]

  def index
    @reports = Report.all # car un seul diagnosticien pour l'instant
  end

  def show
    @sections = Section.all
    @booking = @report.booking
  end

  def edit
    @booking = @report.booking
    @sections = Section.all
  end

  private

  def params_user
    @user = current_user
  end

  def params_report
    @report = Report.find(params[:id])
  end
end
