#COMMON STUFF FOR DEV AND PROD

Availability.destroy_all
puts "Availability destroyed"
Answer.destroy_all
puts "Answer destroyed"
Question.destroy_all
puts "Question destroyed"
Report.destroy_all
puts "Report destroyed"
Booking.destroy_all
puts "Booking destroyed"
OptionChoice.destroy_all
puts "OptionChoice destroyed"
OptionGroup.destroy_all
puts "OptionGroup destroyed"
Section.destroy_all
puts "Section destroyed"
Unit.destroy_all
puts "Unit destroyed"
User.destroy_all
puts "User destroyed"
Foreman.destroy_all
puts "Foreman destroyed"
Branch.destroy_all
puts "Branch destroyed"
CompanyProduct.destroy_all
puts "CompanyProduct destroyed"
Company.destroy_all
puts "Company destroyed"
ProductOption.destroy_all
puts "ProductOption destroyed"
Product.destroy_all
puts "Product destroyed"
OptionValue.destroy_all
puts "OptionValue destroyed"
Option.destroy_all
puts "Option destroyed"
BookedProductOption.destroy_all
puts "BookedProductOption destroyed"

#COMPANIES & BRANCHES & FOREMEN


Company.create(name: "Particulier", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1515313237/house-with-garden_1f3e1_gsndth.png")
Branch.create(company_id: Company.last.id, name: "Particulier")
Company.create(name: "JFM Conseils", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513872039/vcekpepvnrcjqtqfmgno.png")
Branch.create(company_id: Company.last.id, name: "Les Ulis", city: "Les Ulis", zipcode: "91400")
Branch.create(company_id: Company.last.id, name: "Compiègne", city: "Compiègne", zipcode: "60200")

prenoms = ["Jean", "James", "Jamel", "Michel"]
noms = ["Carambole", "Duguesclin", "Durand", "Ramirez"]
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

puts "#{Company.all.count} entreprises crées avec un total de #{Branch.count} branches."
Company.where(name: "Colas").update(photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513872034/cfvrnbtt3vsxmsrowdo3.jpg")
Company.where(name: "Vinci").update(photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513621099/it12ozopccym0nsbx0rm.png")
Company.where(name: "EDF").update(photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513346869/dwb3llvaztsfnag9xbkn.jpg")


#USERS

particulier = User.create!(email: "particulier@led.fr", password: "123soleil", first_name: "Sarah", last_name: "Particulier", phone:"06 11 22 33 44", role:0, company: Company.where(name: "Particulier").first, branch: Branch.where(name: "Particulier").first)
pro = User.create!(email: "pro@led.fr", password: "123soleil", first_name: "Marcel", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.first, branch: Company.first.branches.first)
pro2 = User.create!(email: "pro2@led.fr", password: "123soleil", first_name: "Alexandra", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.second, branch: Company.second.branches.first)
pro3 = User.create!(email: "pro3@led.fr", password: "123soleil", first_name: "Ivan", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.third, branch: Company.third.branches.first)
technician = User.create!(email: "tech@led.fr", password: "123soleil", first_name: "Marie", last_name: "Tech", phone:"06 11 22 33 44", role:2, company: Company.last, branch: Branch.last)
technician2 = User.create!(email: "tech2@led.fr", password: "123soleil", first_name: "Tom", last_name: "Tech", phone:"06 11 22 33 44", role:2, company: Company.last, branch: Branch.last)
manager = User.create!(email: "manager@led.fr", password: "123soleil", first_name: "Fabrice", last_name: "Manager", phone:"06 11 22 33 44", role:3, company: Company.last, branch: Branch.last)
admin = User.create!(email: "admin@led.fr", password: "123soleil", first_name: "Ad", last_name: "Min", phone:"06 11 22 33 44", role:4, company: Company.last, branch: Branch.last)
puts "#{User.all.size} Users créés."

#AVAILABILITIES

next_90 = (-2..90).to_a
next_90.each do |numero|
  User.all.where(role: 2).each do |user|
    date = numero.business_days.from_now
    Availability.find_or_create_by(user_id: user.id, date: Date.new(date.year, date.month, date.day), half: "matin" )
    Availability.find_or_create_by(user_id: user.id, date: Date.new(date.year, date.month, date.day), half: "aprem" )
  end
end
puts "#{Availability.all.size} Availabilities créées."

#PRODUCTS

produits = ["Marquage-Piquetage", "Sécurisation de sondages", "Récolement de réseaux"]
produits.each do |produit|
  prod = Product.create(label: produit)
  if prod.label == "Marquage-Piquetage"
    option1 = Option.create(label: "Types de réseaux", custom_value: false)
    types_reseaux = ["Tous (sauf assainissement)", "Electricité", "Eclairage", "Signalisation routière", "Gaz", "Hydrocarbures", "Produits chimiques", "Eau potable", "Chauffage/Clim", "Télécommunications"]
    types_reseaux.each do |label|
      OptionValue.create(option: option1, label: label, active: true)
    end
    option2 = Option.create(label: "Longueur de voirie (en ml)", custom_value: true )
    ProductOption.create(product: prod, option: option2)
    option3 = Option.create(label: "Surface (en m2)", custom_value: true )
    ProductOption.create(product: prod, option: option3)
    option4 = Option.create(label: "Date de début des travaux", custom_value: true)
    ProductOption.create(product: prod, option: option2)

  elsif prod == "Sécurisation de sondages"
    option5 = Option.create(label: "Localisation", custom_value: false)
    reponses5 = ["Zone privée", "Zone publique"]
    reponses5.each do |label|
      OptionValue.create(option: option5, label: label, active: true)
    end
    option6 = Option.create(label: "Zone Privée", custom_value: true)
    ProductOption.create(product: prod, option: option6)
    option7 = Option.create(label: "Nombre de points de sondage", custom_value: true)
    ProductOption.create(product: prod, option: option7)

  elsif prod == "Récolement de réseaux"
    option8 = Option.create(label: "Longueur de réseau à récoler (en ml)", custom_value: true )
    ProductOption.create(product: prod, option: option8)
  end

end
puts "#{Product.all.size} produits créés"
puts "#{OptionValue.all.size} OptionValues créées"
puts "#{ProductOption.all.size} OptionValues créées"

#COMPANY_PRODUCTS

Company.where(name: "JFM Conseils").each do |company|
  Product.all.each do |product|
    CompanyProduct.create(product_id: product.id, company_id: company.id)
  end
end
puts "#{CompanyProduct.all.size} CompanyProducts créés"

#BOOKINGS

clients = [particulier, pro, pro2, pro3]
dates =[Date.today, Date.today + 1, Date.today + 4,Date.today + 5, Date.today + 7, Date.today + 12 ]


Booking.create(user_id: clients.sample.id, address1: "108 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "5 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "10 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "166 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "55 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "11 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "16 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)
Booking.create(user_id: clients.sample.id, address1: "1 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Report.create(booking_id: Booking.last.id)

puts "#{Booking.all.size} Bookings crées pour un total de #{Availability.where.not(booking_id: nil).count} Availabilities. (avec #{Report.all.size} report qui lui est adjoint.)"

Availability.where.not(booking_id: nil).where(status: "free").update(status: "booked")
Booking.all.each do |booking|
  booking.availabilities.empty?
  Availability.where(booking_id: nil).first(3).each do |availability|
    availability.update(booking: booking)
  end
end

#BOOKED_PRODUCT_OPTIONS

Booking.all.each do |booking|
    booking.product.options.each do |option|
    if option.custom_value?
      BookedProductOption.create(booking: booking, option: option, value: (100..5000).to_a.sample)
    else
      BookedProductOption.create(booking: booking, option: option, option_values: OptionValue.where(option: option).first.sample.first(1..2.to_a))
    end
  end
end

puts "#{BookedProductOption.all.size} BookedProductOption créées"

#SECTIONS

sections = ["Désignation du chantier", "Contexte du chantier", "Recommandations et localisations des ouvrages", "Signataires"]
sections.each do |section|
  Section.create(name: section)
end
puts "Création des #{Section.count} sections"


#UNITS

units = ["cm", "m", "m^2", "km", "€", "jours", "années"]
units.each do |unit|
  Unit.create(name: unit)
end
puts "Création des #{Unit.all.size} unités de mesure"


#OPTION GROUPS

option_groups = ["groupe 0", "groupe 1", "groupe 2", "groupe 3"]
option_groups.each do |option|
  OptionGroup.create(name: option)
end
puts "Création des #{OptionGroup.count} option groups"

#OPTION CHOICES

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

# QUESTIONS
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


# SEPARATION DEV/PROD
