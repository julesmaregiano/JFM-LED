class Manager::BranchesController < ApplicationController

  def create
    @user = current_user
    @branch = Branch.new(params_branch)
    if @branch.save
      redirect_to manager_user_path(@user)
    else
      render :edit
    end
  end

  def update
    @user = current_user
    @branch = Branch.find(params[:id])
    if @branch.update(params_company)
      redirect_to manager_user_path(@path)
    else
      render :edit
    end
  end

  private

  def params_branch
    params.require(:branch).permit(:name, :photo, :company_id, address_attributes: [:address1, :address2, :zipcode, :city, :country])
  end
end
