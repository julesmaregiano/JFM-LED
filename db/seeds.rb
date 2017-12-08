# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Availability.destroy_all
Booking.destroy_all
Report.destroy_all
Question.destroy_all
OptionChoice.destroy_all
OptionGroup.destroy_all
Section.destroy_all
Unit.destroy_all
Answer.destroy_all
User.destroy_all
Foreman.destroy_all
Branch.destroy_all
Company.destroy_all

prenoms = ["Jean", "James", "Jamel", "Jin"]
noms = ["Carambolin", "Plastrouier", "Dimitrius", "Robert"]
companies = ["Colas", "Vinci", "EDF"]
companies.each_with_index do |company, index|
  new_company = Company.create(name: company)
  2.times do
    new_branch = Branch.create(company_id: new_company.id, name: "Branche #{index + 1}")
    3.times do
      Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch_id: new_branch.id, phone: "06 47 05 11 44")
    end
  end
end

puts "#{Company.count} entreprises crées avec un total de #{Branch.count} branches et #{Foreman.count} Chefs de chantier."
particulier = User.create!(email: "particulier@led.fr", password: "123soleil", first_name: "Parti", last_name: "Culier", phone:"06 11 22 33 44", role:0)
pro = User.create!(email: "pro@led.fr", password: "123soleil", first_name: "Pro", last_name: "Fessionnel", phone:"06 11 22 33 44", role:1, company_id: Company.first)
pro2 = User.create!(email: "pro2@led.fr", password: "123soleil", first_name: "Pro2", last_name: "Fessionnel2", phone:"06 11 22 33 44", role:1, company_id: Company.second)
pro3 = User.create!(email: "pro3@led.fr", password: "123soleil", first_name: "Pro3", last_name: "Fessionnel3", phone:"06 11 22 33 44", role:1, company_id: Company.third)
technician = User.create!(email: "tech@led.fr", password: "123soleil", first_name: "Tech", last_name: "Nician", phone:"06 11 22 33 44", role:2)
technician2 = User.create!(email: "tech2@led.fr", password: "123soleil", first_name: "Tech2", last_name: "Nician2", phone:"06 11 22 33 44", role:2)
manager = User.create!(email: "manager@led.fr", password: "123soleil", first_name: "Ma", last_name: "Nager", phone:"06 11 22 33 44", role:3)
admin = User.create!(email: "admin@led.fr", password: "123soleil", first_name: "Ad", last_name: "Min", phone:"06 11 22 33 44", role:4)
puts "#{User.all.size} Users créés."


next_90 = (0..90).to_a
next_90.each do |numero|
  User.all.where(role: 2).each do |user|
    date = numero.business_days.from_now
    Availability.find_or_create_by(user_id: user.id, date: Date.new(date.year, date.month, date.day), status: true, half: 0 )
    Availability.find_or_create_by(user_id: user.id, date: Date.new(date.year, date.month, date.day), status: true, half: 1 )
  end
end
puts "#{Availability.all.size} Availabilities créées."

clients = [particulier, pro, pro2, pro3]

dates =[Date.today, Date.today + 1, Date.today + 4,Date.today + 5, Date.today + 7, Date.today + 12 ]


Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "108 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "5 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "10 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "166 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "55 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "11 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "16 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)
Report.create!
Booking.create!(user_id: [particulier.id, pro.id].sample, address1: "1 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", report_id: Report.last.id, foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.where(status: true).first(2).to_a)

puts "#{Booking.all.size} Bookings crées. (avec #{Report.all.size} report qui lui est adjoint.)"

sections = ["Désignation du chantier", "Contexte du chantier", "Recommandations et localisations des ouvrages", "Signataires"]
sections.each do |section|
  Section.create(name: section)
end
puts "Création des #{Section.count} sections"

units = ["cm", "m", "m^2", "km", "€", "jours", "années"]
units.each do |unit|
  Unit.create(name: unit)
end
puts "Création des #{Unit.all.size} unités de mesure"


option_groups = ["groupe 0", "groupe 1", "groupe 2", "groupe 3"]
option_groups.each do |option|
  OptionGroup.create(name: option)
end
puts "Création des #{OptionGroup.count} option groups"

option_choices = {
  "groupe 0" => [],
  "groupe 1" => ["Oui", "Non"],
  "groupe 2" => ["Vrai", "Faux"],
  "groupe 3" => ["Electricité (BT, HTA, HTB)", "Eclairage", "Feux tricolores et signalisation routière", "Gaz", "Hydrocarbures", "Produits chimiques", "Eau potable", "Assainissement (EU-EP)", "Chauffage/Clim", "Télécommunications", "Zone d'emprise multiréseaux"],
}

option_choices.each { |key, value|
  value.each {|choix|
    OptionChoice.create(option_group: OptionGroup.find_by(name: key), name: choix)
  }
}

# RAPPEL enum input_type: {option_choice_id: 0, numeric: 1, string: 2, boolean: 3}

puts "Création des #{OptionChoice.count} option choices"

question1 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Désignation du chantier", information: "designation_chantier", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question2 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Nom du maître d'oeuvre", information: "nom_maitre_oeuvre", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question3 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Numéro de DICT", information: "numero_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question4 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Date de génération du DICT", information: "date_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question5 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Personnes présentes", information: "personnes_presentes", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question6 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Adresse des travaux", information: "adresse_travaux", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question7 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Nature des travaux et techniques utilisées", information: "nature_travaux", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question8 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Date prévisionelle de démarrage", information: "date_demarrage_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question9 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Durée prévisionelle des travaux", information: "duree_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question10 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie la présence des réseaux suivants ?", information: "reseaux_presents", option_group: OptionGroup.find_by(name: "groupe 3"), input_type: 0)
question11 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "S'appuie sur des investigations complémentaires ?", information: "presence_ic", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question12 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie des zones de doutes, à risques (coudes, croisements, branchements) ?", information: "presence_doutes", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question13 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Suit le code couleur règlementaire ?", information: "couleurs_reglementaires", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question14 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise l'axe présumé des ouvrages ?", information: "axe", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question15 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise la zone d'emprise d'un ou plusieurs ouvrages ?", information: "emprise", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question16 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie les profondeurs de l'ouvrage ?", information: "profondeur", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question17 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialse la classe de précision ?", information: "precision", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: 0)
question18 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Remarques du rédacteur :", information: "remarques_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question19 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Durée de l'intervention", information: "duree_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)
question20 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Observations des parties", information: "observations_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: 2)


puts "Questions créées: #{Question.count}"

Availability.where(booking_id: nil).first(10).each do |availability|
  availability.update(booking_id: Booking.all.sample.id)
end

