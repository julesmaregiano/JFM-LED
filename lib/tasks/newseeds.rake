require 'ffaker'
namespace :newseeds do

  task seed: :environment do
    Address.delete_all
    Report.delete_all
    Availability.delete_all
    Technician.delete_all
    Foreman.delete_all
    Booking.delete_all
    Manager.delete_all
    ServiceProvider.delete_all

    service_provider = ServiceProvider.create! do |sp|
      sp.name    = "JFM"
      sp.siret   = "BLah"
      sp.address = sp.build_address
    end

    Manager.create! do |mgr|
       mgr.first_name       = FFaker::NameFR.first_name
       mgr.last_name        = FFaker::NameFR.last_name
       mgr.email            = 'manager@led.fr'
       mgr.password         = '123soleil'
       mgr.service_provider = service_provider
    end

    3.times do
      t = Technician.create! do |tech|
        tech.first_name       = FFaker::NameFR.first_name
        tech.last_name        = FFaker::NameFR.last_name
        tech.email            = 'path.sene@led.fr'
        tech.service_provider = service_provider
      end
      AvailabilitiesCreatorJob.perform_now(t.id, Date.today.beginning_of_month, Date.today.end_of_month)
    end


  end
end
