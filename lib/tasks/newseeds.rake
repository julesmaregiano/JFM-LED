namespace :newseeds do

  task seed: :environment do
    Manager.delete_all
    Technician.delete_all
    ServiceProvider.delete_all
    service_provider = ServiceProvider.create do |sp|
      sp.name    = "JFM"
      sp.siret   = "BLah"
      sp.address = sp.build_address
    end

    manager = Manager.create do |mgr|
       mgr.first_name       = 'Jules'
       mgr.last_name        = 'Marechianno'
       mgr.email            = 'manager@led.fr'
       mgr.password         = '123soleil'
       mgr.service_provider = service_provider
    end

    40.times do
      Technician.create! do |tech|
        tech.first_name = 'Pathe'
        tech.last_name  = 'SENE'
        tech.email      = 'path.sene@led.fr'
      end
    end
  end
end
