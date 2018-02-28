  class Manager::ReportsController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update]
  before_action :set_report, only: [:show, :edit, :update]
  before_action :set_booking, only: [:show, :edit, :update]
  before_action :set_client, only: [:show, :edit, :update]
  before_action :set_tech, only: [:show, :edit, :update]
  before_action :set_sections, only: [:edit, :update]

  def index
    @reports = Report.all.sort_by(&:created_at).map do |r| r if r.booking.availabilities.first.user.branch == @user.branch end.compact # car un seul diagnosticien pour l'instant
  end

  def show
    @sections = @booking.product.sections.uniq.sort_by(&:created_at).map do |s| s if s.has_answers?(@report) end.compact.sort_by(&:order)
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
    @sections = @booking.product.sections.uniq.sort_by(&:order)
    @questions = @booking.product.questions.where(active: true)
    @questions_per_section = @questions.group_by(&:section)
    build_answers
  end

  def update
    @sections = @booking.product.sections.uniq.sort_by(&:order)
    if @report.update(report_params)
      unless @report.signature == empty_signature_string
        @report.signed_on = DateTime.now
        @report.save
      end
      flash[:notice] = "Le rapport a bien été enregistré."
      redirect_to [@user.role, @report]
    else
      @questions = @booking.product.questions
      @questions_per_section = @questions.group_by(&:section)
      build_answers
      render :edit
    end
  end

  def send_report_mail
    @user = current_user
    @report = Report.find(params[:id])
    ReportMailer.report_complete(@report).deliver
    flash[:notice] = "Le rapport a bien été envoyé."
    redirect_to([@user.role, @report])
  end

  private

  def report_params
    params[:report][:answers_attributes].each do |answer_index, answer_params|
      if answer_params.has_key?("multiple_answer") && answer_params.has_key?("option_choice_id") == false
        params[:report][:answers_attributes][answer_index][:_destroy] = true
      end
    end
    params.require(:report).permit(:signature, :signed_on, photos:[], answers_attributes: [:id, :_destroy, :report_id, :string, :numeric, :boolean, :question_id, :date, :option_choice_id, option_choice_id: []])
  end

  def set_user
    @user = current_user
  end

  def set_report
    @report = Report.find(params[:id])
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
    @sections = @booking.product.sections.uniq.sort_by(&:order)
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
          @answers_per_question[question] = [Answer.new(question: question, report: @report)]
        end
      end

    end
  end

  def empty_signature_string
    "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAAEsCAYAAAB5fY51AAABdElEQVR4nO3BMQEAAADCoPVPbQwfoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD+Bn+3AAEkkD9cAAAAAElFTkSuQmCC"
  end

end
