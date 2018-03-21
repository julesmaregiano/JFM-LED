class Manager::AvailabilitiesController < Manager::ApplicationController

  def index
    @user           = current_user
    @techs          = current_manager.service_provider.technicians
    @availabilities = Availability.to_come.includes(:user)
  end

  def create
    @user = current_user
    @availability = Availability.new(params_availability)
    if @availability.save
      redirect_to manager_availabilities_path
    else
      render :edit
    end
  end

  def update
    @user = current_user
    @availability = Availability.find(params[:id])
    if @availability.update(params_availability)
      respond_to do |format|
        format.html {redirect_to manager_availabilities_path}
        format.js
      end
    else
      respond_to do |format|
        format.html {render :edit}
        format.js
      end
    end
  end

  def vacation
    availabilities = Availability.free.where("id IN (?)", collection_params)
    availabilities.update_all(status: :vacation)
    redirect_to request.referrer, notice: 'Vos disponibilités on été mises à jour'
  end

  def training
    availabilities = Availability.free.where("id IN (?)", collection_params)
    availabilities.update_all(status: :training)
    redirect_to request.referrer, notice: 'Vos disponibilités on été mises à jour'
  end

  def unavailable
    availabilities = Availability.free.where("id IN (?)", collection_params)
    availabilities.update_all(status: :unavailable)
    redirect_to request.referrer, notice: 'Vos disponibilités on été mises à jour'
  end

  private

  def collection_params
    params.require(:availability).permit(ids: [])[:ids]
  end

  def params_availability
    params.require(:availability).permit(:status, :user_id, :date, :half)
  end
end
