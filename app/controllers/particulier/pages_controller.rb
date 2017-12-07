class Particulier::PagesController < ApplicationController
  def informations
    @user = current_user
  end
end

