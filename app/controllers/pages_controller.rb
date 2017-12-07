class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:eligibility, :home, :detection, :diagnostic, :societe]

  def home
  end

  def eligibility
    address = Geocoder.search(params[:query][:address]).first
    @address_details = {}

    address.address_components.each do |component|
      if component['types'].include?('street_number')
        @address_details[:street_number] = component['long_name']
      elsif component['types'].include?('route')
        @address_details[:street] = component['long_name']
      elsif component['types'].include?('locality')
        @address_details[:city] = component['long_name']
      elsif component['types'].include?('postal_code')
        @address_details[:zip_code] = component['long_name']
      elsif component['types'].include?('country')
        @address_details[:country] = component['short_name']
      end
    end

    @eligible = @address_details[:zip_code].start_with?('75')
  end

  def detection
  end

  def diagnostic
  end

  def societe
  end
end
