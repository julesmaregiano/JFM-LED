class Technician::ReportsController < ApplicationController
  before_action :user_params, only: [:index, :show, :edit]
  before_action :report_id_params, only: [:show, :edit, :update]


  def index
    @user = current_user
    @reports = Report.all # car un seul diagnosticien pour l'instant
  end

  def show
    @user = current_user
    @booking = @report.booking
    @client = @booking.user
    @tech = @booking.availabilities.first.user
    @sections = Section.all
  end

  def edit
    @user = current_user
    @booking = @report.booking
    @client = @booking.user
    @tech = @booking.availabilities.first.user
    @sections = Section.all
    @report.answers.build
  end

  def update
    @booking = @report.booking
    @client = @booking.user
    @tech = @booking.availabilities.first.user
    @user = user_params
    @sections = Section.all
    binding.pry
    if @report.update(report_params)
      redirect_to technician_report_path(@report)
    else
      render :edit
    end
  end


  private

  def user_params
    @user = current_user
  end

  def report_id_params
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(photos:[], answers_attributes: [:id, :report_id, :string, :nuemric, :boolean, :question_id, :option_choice_id])
  end
end
