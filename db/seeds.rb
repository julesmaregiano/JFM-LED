#COMMON STUFF FOR DEV AND PROD

Address.destroy_all
puts "Addresses destroyed"
Availability.destroy_all
puts "Availability destroyed"
Answer.destroy_all
puts "Answer destroyed"
Question.destroy_all
puts "Question destroyed"
ProductQuestion.destroy_all
puts "ProductQuestions destroyed"
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


# Company.create(name: "Particulier", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1515313237/house-with-garden_1f3e1_gsndth.png")
# Branch.create(company: Company.last, name: "Particulier")
Company.create(name: "JFM Conseils", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513872039/vcekpepvnrcjqtqfmgno.png")
Branch.create(company: Company.last, name: "Les Ulis", city: "Les Ulis", zipcode: "91400")
Address.create(address1: "1 rue de la Terre de Feu", zipcode: "91", city: "Les Ulis" , country: "France", branch: Branch.last)
Branch.create(company: Company.last, name: "Compiègne", city: "Compiègne", zipcode: "60200")
Address.create(address1: "20 Rue du Fonds Pernant", address2: "Immeuble Thalassa, ZAC des Mercières" , zipcode: "60200", city: "Compiègne" , country: "France", branch: Branch.last)

prenoms = ["Jean", "James", "Jamel", "Michel"]
noms = ["Carambole", "Duguesclin", "Durand", "Ramirez"]
companies = ["Colas", "Vinci", "EDF"]

colas = Company.create(name: "Colas", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513872034/cfvrnbtt3vsxmsrowdo3.jpg")
Branch.create(company: colas, name: "Branche Aulnay")
Address.create(branch: Branch.last, address1: "10 r Nicolas Robert", zipcode: "93600", city: "Aulnay-Sous-Bois" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")
Branch.create(company: colas, name: "Branche Aulnay")
Address.create(branch: Branch.last, address1: "110 Rue Gabriel Péri", zipcode: "94240", city: "L'Haÿ-les-Roses" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")

edf = Company.create(name: "EDF", photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513621099/it12ozopccym0nsbx0rm.png")
Branch.create(company: edf, name: "Boutique Montmartre")
Address.create(branch: Branch.last, address1: "67 Rue Pajol", zipcode: "75018", city: "Paris" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")
Branch.create(company: edf, name: "Boutique Ivry sur Seine")
Address.create(branch: Branch.last, address1: "7 Avenue de la République", zipcode: "94205", city: "Ivry-sur-Seine" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")

vinci = Company.create(name: "Vinci",photo_url: "http://res.cloudinary.com/zanzibar/image/upload/v1513346869/dwb3llvaztsfnag9xbkn.jpg")
Branch.create(company: vinci, name: "Vinci Roubaix")
Address.create(branch: Branch.last, address1: "106 Quai de Boulogne", zipcode: "59100", city: "Roubaix" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")
Branch.create(company: vinci, name: "Vinci Energies Nord")
Address.create(branch: Branch.last, address1: "41 Avenue de l'Harmonie", zipcode: "59650", city: "Villeneuve-d'Ascq" , country: "France" )
Foreman.create(first_name: prenoms.sample, last_name: noms.sample, branch: Branch.last, phone: "06 47 05 11 44")


puts "#{Company.all.count} entreprises crées avec un total de #{Branch.count} branches soit #{Address.count}."

#USERS

# particulier = User.create!(email: "particulier@led.fr", password: "123soleil", first_name: "Sarah", last_name: "Particulier", phone:"06 11 22 33 44", role:0, company: Company.where(name: "Particulier").first, branch: Branch.where(name: "Particulier").first)
pro = User.create!(email: "pro@led.fr", password: "123soleil", first_name: "Marcel", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.where(name: "Colas").first, branch: Company.where(name: "Colas").first.branches.first)
pro2 = User.create!(email: "pro2@led.fr", password: "123soleil", first_name: "Alexandra", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.where(name: "EDF").first, branch: Company.where(name: "EDF").first.branches.first)
pro3 = User.create!(email: "pro3@led.fr", password: "123soleil", first_name: "Ivan", last_name: "Pro", phone:"06 11 22 33 44", role:1, company: Company.where(name: "Vinci").first, branch: Company.where(name: "Vinci").first.branches.first)
technician = User.create!(email: "tech@led.fr", password: "123soleil", first_name: "Marie", last_name: "Tech", phone:"06 11 22 33 44", role:2, company: Company.where(name: "JFM Conseils").first, branch: Company.where(name: "JFM Conseils").first.branches.first)
technician2 = User.create!(email: "tech2@led.fr", password: "123soleil", first_name: "Tom", last_name: "Tech", phone:"06 11 22 33 44", role:2, company: Company.where(name: "JFM Conseils").first, branch: Company.where(name: "JFM Conseils").first.branches.first)
manager = User.create!(email: "manager@led.fr", password: "123soleil", first_name: "Fabrice", last_name: "Manager", phone:"06 11 22 33 44", role:3, company: Company.where(name: "JFM Conseils").first, branch: Company.where(name: "JFM Conseils").first.branches.first)
nopimanager = User.create!(email: "nopimanager@led.fr", password: "123soleil", first_name: "Manager", last_name: "DeNopi", phone:"06 11 22 33 44", role:3, company: Company.where(name: "JFM Conseils").first, branch: Company.where(name: "JFM Conseils").first.branches.second)
nopitech = User.create!(email: "nopitech@led.fr", password: "123soleil", first_name: "Nopi", last_name: "Tech", phone:"06 11 22 33 44", role:2, company: Company.where(name: "JFM Conseils").first, branch: Company.where(name: "JFM Conseils").first.branches.second)
admin = User.create!(email: "admin@led.fr", password: "123soleil", first_name: "Ad", last_name: "Min", phone:"06 11 22 33 44", role:4, company: Company.last, branch: Branch.last)
puts "#{User.all.size} Users créés."

#AVAILABILITIES

next_90 = (-2..90).to_a
next_90.each do |numero|
  User.all.where(role: 2).each do |user|
    date = numero.business_days.from_now
    Availability.find_or_create_by(user: user, date: Date.new(date.year, date.month, date.day), half: "matin" )
    Availability.find_or_create_by(user: user, date: Date.new(date.year, date.month, date.day), half: "aprem" )
  end
end
puts "#{Availability.all.size} Availabilities créées."

#PRODUCTS

produits = ["Marquage-Piquetage", "Sécurisation de sondages", "Récolement de réseaux"]
produits.each do |produit|
  prod = Product.create(label: produit)
  if prod.label == "Marquage-Piquetage"
    option1 = Option.create(label: "Types de réseaux", custom_value: false)
    ProductOption.create(product: prod, option: option1)
    types_reseaux = ["Tous (sauf assainissement)", "Electricité", "Eclairage", "Signalisation routière", "Gaz", "Hydrocarbures", "Produits chimiques", "Eau potable", "Chauffage/Clim", "Télécommunications", "Indéterminé"]
    types_reseaux.each do |label|
      OptionValue.create(option: option1, label: label, active: true)
    end
    option2 = Option.create(label: "Longueur de voirie (en ml)", custom_value: true )
    ProductOption.create(product: prod, option: option2)
    option3 = Option.create(label: "Surface (en m2)", custom_value: true )
    ProductOption.create(product: prod, option: option3)
    option4 = Option.create(label: "Date de début des travaux", custom_value: true)
    ProductOption.create(product: prod, option: option2)

  elsif prod.label == "Sécurisation de sondages"
    option5 = Option.create(label: "Localisation", custom_value: false)
    ProductOption.create(product: prod, option: option5)
    reponses5 = ["Zone privée", "Zone publique"]
    reponses5.each do |label|
      OptionValue.create(option: option5, label: label, active: true)
    end
    option6 = Option.create(label: "Nombre de points de sondage", custom_value: true)
    ProductOption.create(product: prod, option: option6)

  elsif prod.label == "Récolement de réseaux"
    option7 = Option.create(label: "Longueur de réseau à récoler (en ml)", custom_value: true )
    ProductOption.create(product: prod, option: option7)
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

clients = [pro, pro2, pro3]
dates =[Date.today, Date.today + 1, Date.today + 4,Date.today + 5, Date.today + 7, Date.today + 12 ]

Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "108 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "5 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "10 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "166 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "55 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "11 avenue de Suffren", zipcode: "75015", city: "Paris", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "16 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", booking: Booking.last)
Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
Address.create(address1: "1 villa gaudelet", zipcode: "75011", city: "Paris", country: "FR", booking: Booking.last)

puts "#{Booking.all.size} Bookings crées pour un total de #{Availability.where.not(booking_id: nil).count} Availabilities. (avec #{Report.all.size} report et #{Address.all.size} adresses.)"

Availability.where.not(booking_id: nil).where(status: "free").update(status: "booked")
Booking.all.each do |booking|
  booking.availabilities.empty?
  Availability.where(booking_id: nil).first(3).each do |availability|
    availability.update(booking: booking, status: "booked")
  end
end

#BOOKED_PRODUCT_OPTIONS

Booking.all.each do |booking|
    booking.product.options.each do |option|
    if option.custom_value?
      BookedProductOption.create(booking: booking, option: option, value: (100..5000).to_a.sample)
    else
      BookedProductOption.create(booking: booking, option: option, option_value: OptionValue.where(option: option).first)
    end
  end
end

puts "#{BookedProductOption.all.size} BookedProductOption créées"

#SECTIONS

sections = ["Désignation du chantier",
            "Contexte du chantier",
            "Recommandations et localisations des ouvrages",
            "Précisions sur les réseaux d'éclairage",
            "Précisions sur les réseaux d'électricité",
            "Précisions sur les réseaux de signalisation (SLT)",
            "Précisions sur les réseaux de gaz",
            "Précisions sur les réseaux d'eau potable (AEP)",
            "Précisions sur les réseaux de télécom(s)",
            "Précisions sur les réseaux indéterminés",
            "Signataires"]
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

option_groups = ["groupe 0", "groupe 1", "groupe 2", "groupe 3", "groupe 4", "groupe 5", "groupe 6"]
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
  "groupe 4" => ["Classe A","Classe B", "Classe C"],
  "groupe 5" => ["Absence de DICT", "DICT complète", "DICT incomplète"],
  "groupe 6" => ["Rien à signaler", "Ecarts IC/DT", "Quelques points en B", "Prudence lors des travaux"]
}

option_choices.each { |key, value|
  value.each {|choix|
    OptionChoice.create(option_group: OptionGroup.find_by(name: key), name: choix)
  }
}

# QUESTIONS
# RAPPEL enum input_type: {option_choice_id: 0, numeric: 1, string: 2, boolean: 3}

puts "Création des #{OptionChoice.count} option choices"

question1 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Désignation du chantier", information: "designation_chantier", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question2 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Nom du maître d'oeuvre", information: "nom_maitre_oeuvre", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: false)
question3 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Numéro de DICT", information: "numero_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question4 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Date de génération du DICT", information: "date_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "date", active: true)
question5 = Question.create!( section: Section.find_by(name: "Désignation du chantier"), name: "Personnes présentes", information: "personnes_presentes", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: false)
question7 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Nature des travaux et techniques utilisées", information: "nature_travaux", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question8 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Date prévisionelle de démarrage", information: "date_demarrage_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "date", active: true)
question9 = Question.create!( section: Section.find_by(name: "Contexte du chantier"), name: "Durée prévisionelle des travaux", information: "duree_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)

question10 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie la présence des réseaux suivants ?", information: "reseaux_presents", option_group: OptionGroup.find_by(name: "groupe 3"), input_type: "option_choice_id", active: true, display: "check_boxes")
question11 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "S'appuie sur des investigations complémentaires ?", information: "presence_ic", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question12 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie des zones de doutes, à risques (coudes, croisements, branchements) ?", information: "presence_doutes", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question13 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Suit le code couleur règlementaire ?", information: "couleurs_reglementaires", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question14 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise l'axe présumé des ouvrages ?", information: "axe", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question15 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise la zone d'emprise d'un ou plusieurs ouvrages ?", information: "emprise", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question16 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie les profondeurs de l'ouvrage ?", information: "profondeur", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question17 = Question.create!( section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise la classe de précision ?", information: "precision", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")

Section.find((4..10).to_a).each do |section|
question10a = Question.create!( section: section, name: "Classe de réseaux", option_group: OptionGroup.find_by(name: "groupe 4"), input_type: "option_choice_id", active: true, display: "check_boxes")
question10b = Question.create!( section: section, name: "Commentaire sur la DICT", option_group: OptionGroup.find_by(name: "groupe 5"), input_type: "option_choice_id", active: true, display: "check_boxes")
question10c = Question.create!( section: section, name: "Avis du technicien", option_group: OptionGroup.find_by(name: "groupe 6"), input_type: "option_choice_id", active: true, display: "check_boxes")
question10d = Question.create!( section: section, name: "Concessionnaire", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
end

question18 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Remarques du rédacteur :", information: "remarques_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "text")
question19 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Durée de l'intervention", information: "duree_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "integer")
question20 = Question.create!( section: Section.find_by(name: "Signataires"), name: "Observations des parties", information: "observations_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "text")
puts "Questions créées: #{Question.count}"

Product.all.each do |product|
  Question.all.each do |q|
    ProductQuestion.create(product: product, question: q)
  end
end

puts "ProductQuestions: #{ProductQuestion.count}"


# SEPARATION DEV/PROD
