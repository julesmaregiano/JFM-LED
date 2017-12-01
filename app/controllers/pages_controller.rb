class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:eligibility, :home, :detection, :diagnostic, :societe]

  def home
  end

  def eligibility
  end

  def detection
  end

  def diagnostic
  end

  def societe
  end
end
