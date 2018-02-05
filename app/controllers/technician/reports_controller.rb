class Technician::ReportsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update]
  before_action :set_report, only: [:show, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_client, only: [:show, :edit, :update]
  before_action :set_tech, only: [:show, :edit, :update]
  before_action :set_sections, only: [:show, :edit, :update]


  def index
    @reports = Report.all.sort_by(&:created_at) # car un seul diagnosticien pour l'instant
  end

  def show
  end

  def edit
    # @report.answers.build
    @questions = @booking.product.questions
    @questions_per_section = @questions.group_by(&:section)
    build_answers
  end

  def update
    @report.signed_on = DateTime.now
    if @report.update(report_params)
      params[:report][:answers_attributes].each do |k, v|
        if v["option_choice_id"].class == Array
          v["option_choice_id"].reject { |s| s.empty? }.each do |oc|
            Answer.find_or_create_by(option_choice_id: oc.to_i, question: Answer.find(v["id"].to_i).question, report: @report)
          end
          Answer.find(v["id"].to_i).destroy
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
    params.require(:report).permit(:signature, :signed_on, photos:[], answers_attributes: [:id, :report_id, :string, :numeric, :boolean, :question_id, :date, :option_choice_id, option_choice_id: []])
  end

  def build_answers
    # Si il y a déjà des réponses
    if @report.answers.any?
      @answers_per_question = @report.answers.group_by(&:question)
      # Pour chaque Question à Choix Multiple
      @questions.where(display: "check_boxes").each do |question|
        # Si l'utilsateur a déjà sélectionné au moins l'un des choix, on repropose les autres options
        if @answers_per_question[question]
          question.option_choices.where.not(id: @answers_per_question[question].map(&:option_choice_id)).each do |option_choice|
            @answers_per_question[question] << Answer.new(question: question, report: @report, option_choice: option_choice)
          end
        # Si il n'a rien sélectionné, on propose toutes les options
        else
          @answers_per_question[question] = question.option_choices.map do |option_choice|
            Answer.new(question: question, report: @report, option_choice: option_choice)
          end
        end
      end
    # Si la personne n'a répondu à rien
    else
      @answers_per_question = {}


      @questions.each do |question|
        # Si c'est une question à choix multiple on propose toutes les réponses
        if question.check_boxes?
          @answers_per_question[question] = question.option_choices.map do |option_choice|
            Answer.new(question: question, report: @report, option_choice: option_choice)
          end
        # Si choix unique, on propose une réponse
        else
          @answers_per_question[question] = Answer.new(question: question, report: @report)
        end
      end

    end
  end
end
