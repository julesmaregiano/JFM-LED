class Manager::CompaniesController < ApplicationController

  def create
    @user = current_user
    @company = Company.new(params_company)
    if @company.save
      redirect_to manager_user_path(@user)
    else
      render :edit
    end
  end

  def update
    @user = current_user
    @company = company.find(params[:id])
    if @company.update(params_company)
      redirect_to manager_user_path(@path)
    else
      render :edit
    end
  end

  private

  def params_company
    params.require(:company).permit(:name, :photo)
  end
end
