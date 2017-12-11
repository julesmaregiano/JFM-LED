class Technician::ReportsController < ApplicationController
  before_action :params_user, only: [:index, :show, :edit]
  before_action :params_report, only: [:show, :edit]

  def index
    @reports = Report.all # car un seul diagnosticien pour l'instant
  end

  def show
    @sections = Section.all
    @section1 = Section.where(name: "Désignation du chantier").first
    @section2 = Section.where(name: "Contexte du chantier").first
    @section3 = Section.where(name: "Recommandations et localisations des ouvrages").first
    @section4 = Section.where(name: "Signataires").first
    @booking = @report.booking
  end

  def edit
    @booking = @report.booking
    @sections = Section.all
    @section1 = Section.where(name: "Désignation du chantier").first
    @section2 = Section.where(name: "Contexte du chantier").first
    @section3 = Section.where(name: "Recommandations et localisations des ouvrages").first
    @section4 = Section.where(name: "Signataires").first
  end

  def update
    @user = params_user
    @report = Report.find(params[:id])
    @sections = Section.all
    @booking = @report.booking
    if @report.update(photos_params)
      redirect_to([@user.role, @report])
    else
      render :edit
    end
  end


  private

  def params_user
    @user = current_user
  end

  def params_report
    @report = Report.find(params[:id])
  end

  def photos_params
    params.require(:report).permit(photos:[])
  end
end
