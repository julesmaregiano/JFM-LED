class Technician::ReportsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update]
  before_action :set_report, only: [:show, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_client, only: [:show, :edit, :update]
  before_action :set_tech, only: [:show, :edit, :update]
  before_action :set_sections, only: [:show, :edit, :update]


  def index
    @reports = Report.all # car un seul diagnosticien pour l'instant
  end

  def show
  end

  def edit
    @report.answers.build
  end

  def update
    @report.signed_on = DateTime.now
    if @report.update(report_params)
      params[:report][:answers_attributes].each do |k, v|
        unless v["option_choice_id"].nil?
          if v["option_choice_id"].class == Array
            Answer.find(v["id"].to_i).answer_option_choices.destroy_all
            v["option_choice_id"].reject { |s| s.empty? }.each do |oc|
              AnswerOptionChoice.find_or_create_by(option_choice_id: oc.to_i, answer_id: v["id"].to_i)
            end
          end
        end
      end

      redirect_to technician_report_path(@report)
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
    @sections = @booking.product.sections.uniq
  end

  def report_params
    params.require(:report).permit(:signature, photos:[], answers_attributes: [:id, :report_id, :string, :numeric, :boolean, :question_id, :date, :option_choice_id])
  end
end
