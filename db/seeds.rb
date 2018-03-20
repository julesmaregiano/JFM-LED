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
Technician.destroy_all
Manager.destroy_all
puts "Foreman destroyed"
CompanyProduct.destroy_all
puts "CompanyProduct destroyed"
Branch.destroy_all
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


service_provider = ServiceProvider.create! do |sp|
                     sp.name =       "JFM Conseils",
                     sp.siret =      "43540466000027",
                     sp.photo_url =  "http://res.cloudinary.com/zanzibar/image/upload/v1513872039/vcekpepvnrcjqtqfmgno.png",
                     sp.address = Address.create! do |a|
                       a.address1 =      "1 rue de la Terre de Feu",
                       a.zipcode =       "91",
                       a.city =          "Les Ulis",
                       a.country =       "France"
                     end
                   end
puts "ServiceProvider créé"

# [SHOULD BE] construction_company = ConstructioCompany.create! do |cc|
construction_company = Company.create! do |cc|
                         cc.name =       "Colas Aulnay-Sous-Boisn",
                         cc.siret =      "43512466000027",
                         cc.photo_url =  "http://res.cloudinary.com/zanzibar/image/upload/v1513872034/cfvrnbtt3vsxmsrowdo3.jpg",
                         cc.address = Address.create! do |a|
                           a.address1 =      "10 r Nicolas Robert",
                           a.zipcode =       "93600",
                           a.city =          "Aulnay-Sous-Bois",
                           a.country =       "France"
                         end
                       end

puts "ConstructionCompany créée"

foreman = Foreman.create! do |f|
                            f.first_name =  "Richard",
                            f.last_name =   "Du Chantier",
                            f.phone =       "06 47 05 11 44"
                            f.service_provider = service_provider
                            # [SHOULD BE] f.construction_company = construction_company
                          end
puts "Foreman créé"

#USERS

pro = User.create! do |p|
        p.first_name =  "Marcel",
        p.last_name =   "Pro",
        p.email =       "prololo@led.fr",
        p.password =    "123soleil",
        p.phone =       "06 11 22 33 44",
        p.company =     construction_company
      end
puts "Pro créé"

tech = Technician.create! do |t|
        t.first_name =       "Marie",
        t.last_name =        "Tech",
        t.email =            "tech@led.fr",
        # t.password =         "123soleil", Le technician n'a pas encore de model Devise j'imagine ?
        # t.phone =            "06 11 22 33 44", Rajouter une colonne phone pour le Technician
        t.service_provider = service_provider
        t.address = Address.create! do |a|
                      a.address1 =      "108 Avenue de la Dimancherie",
                      a.zipcode =       "91440",
                      a.city =          "Bures sur Yvette",
                      a.country =       "France"
         end
       end
puts "Tech créé"

manager = Manager.create! do |m|
            m.first_name =        "Nadège",
            m.last_name =         "Genestie",
            m.email =             "manager@led.fr",
            m.password =          "123soleil",
            # m.phone =             "06 11 22 33 44", Le manager doit également avoir un colonne phone
            m.service_provider =  service_provider
          end
puts "Manager créé"

#PRODUCT MP

product_mp = Product.create! do |p|
  p.label = "Marquage-Piquetage"
end
Rails.logger.info product_mp.inspect

  product_mp_product_option_1 = ProductOption.create! do |po|
    po.product = product_mp
      po.option = Option.create! do |o|
        o.label = "Longueur (en m)"
        o.custom_value = true
      end
  end

  product_mp_product_option_2 = ProductOption.create! do |po|
                                  po.product = product_mp
                                  po.option = Option.create! do |o|
                                    o.label = "Types de réseaux"
                                    o.custom_value = false
                                  end
                                end
  zones_mp = ['Trottoir (2m)', '1 trottoir + 1 chaussée (6m)', '2 trottoirs + 2 chaussées (12m)', 'Boulevard (20m)']
  zones_mp.each do |label|
    OptionValue.create! do |ov|
                          ov.option = product_mp_product_option_2.option
                          ov.label = label
                          ov.active = true
    end
  end

  product_mp_product_option_3 = ProductOption.create! do |po|
                                  po.product = product_mp
                                  po.option = Option.create! do |o|
                                    o.label = "Types de réseaux"
                                    o.custom_value = false
                                  end
                                end
    types_reseaux = ['Tous réseaux', 'Tous sauf assainissement', 'Réseaux sensibles']
    types_reseaux.each do |label|
      OptionValue.create! do |ov|
                            ov.option = product_mp_product_option_3.option
                            ov.label = label
                            ov.active = true
      end
    end
puts "Product MP & ses options créé"

#PRODUCT SECURISATION DES SONDAGES

product_sondages = Product.create! do |p|
  p.label == "Sécurisation de sondages"
end

  product_sondages_product_option_1 = ProductOption.create! do |po|
                                        po.product = product_sondages
                                        po.option = Option.create! do |o|
                                          o.label = "Nombre de sondages"
                                          o.custom_value = true
                                        end
                                      end

  product_sondages_product_option_2 = ProductOption.create! do |po|
                                        po.product = product_sondages
                                        po.option = Option.create! do |o|
                                          o.label = "Environnement"
                                          o.custom_value = false
                                        end
                                      end
    zones_sondages = ['Zone Urbaine', 'Zone non-urbaine']
    types_reseaux.each do |label|
      OptionValue.create! do |ov|
                            ov.option = product_sondages_product_option_2.option
                            ov.label = label
                            ov.active = true
      end
    end
puts "Product Sondage & ses options créé"


#COMPANY_PRODUCTS

#ServiceCompany.each do |company|
#  Product.all.each do |product|
#    CompanyProduct.create! do |cp|
#      cp.product_id = product.id
#      cp.company_id = company.id
#    end
#  end
#end
puts "#{CompanyProduct.all.size} CompanyProducts créés"

#BOOKINGS

# dates =[Date.today, Date.today + 1, Date.today + 4,Date.today + 5, Date.today + 7, Date.today + 12 ]

# Booking.create(user_id: clients.sample.id, confirmed_at: dates.sample, comment: "lorem pisumentaire", surface: "225", foreman_id: Foreman.all.to_a.sample.id, availabilities: Availability.to_come.where(status: "free").first(rand(2..5)).to_a, product_id: Product.all.sample.id)
# Address.create(address1: "108 avenue de la Dimancherie", zipcode: "91440", city: "Bures sur Yvette", country: "FR", booking: Booking.last)
# puts "#{Booking.all.size} Bookings crées pour un total de #{Availability.where.not(booking_id: nil).count} Availabilities. (avec #{Report.all.size} report et #{Address.all.size} adresses.)"


#BOOKED_PRODUCT_OPTIONS

# Booking.all.each do |booking|
#     booking.product.options.each do |option|
#     if option.custom_value?
#       BookedProductOption.create(booking: booking, option: option, value: (100..5000).to_a.sample)
#     else
#       BookedProductOption.create(booking: booking, option: option, option_value: OptionValue.where(option: option).first)
#     end
#   end
# end

# puts "#{BookedProductOption.all.size} BookedProductOption créées"

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
counter = 1
sections.each do |section|
  Section.create(order: counter, name: section)
  counter += 1
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
puts "Création des #{OptionChoice.count} option choices"

# QUESTIONS
# RAPPEL enum input_type: {option_choice_id: 0, numeric: 1, string: 2, boolean: 3}


question1 = Question.create!(order: 1, section: Section.find_by(name: "Désignation du chantier"), name: "Désignation du chantier :", information: "designation_chantier", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question2 = Question.create!(order: 2, section: Section.find_by(name: "Désignation du chantier"), name: "Nom du maître d'oeuvre :", information: "nom_maitre_oeuvre", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: false)
question3 = Question.create!(order: 3, section: Section.find_by(name: "Désignation du chantier"), name: "Numéro de DICT :", information: "numero_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question4 = Question.create!(order: 4, section: Section.find_by(name: "Désignation du chantier"), name: "Date de génération du DICT :", information: "date_dict", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "date", active: true)
question5 = Question.create!(order: 5, section: Section.find_by(name: "Désignation du chantier"), name: "Personnes présentes :", information: "personnes_presentes", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: false)
question7 = Question.create!(order: 1, section: Section.find_by(name: "Contexte du chantier"), name: "Nature des travaux et techniques utilisées :", information: "nature_travaux", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question8 = Question.create!(order: 2, section: Section.find_by(name: "Contexte du chantier"), name: "Date prévisionelle de démarrage :", information: "date_demarrage_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "date", active: true)
question9 = Question.create!(order: 3, section: Section.find_by(name: "Contexte du chantier"), name: "Durée prévisionelle des travaux :", information: "duree_previsionelle", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)

question10 = Question.create!(order: 1, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie la présence des réseaux suivants ?", information: "reseaux_presents", option_group: OptionGroup.find_by(name: "groupe 3"), input_type: "option_choice_id", active: true, display: "check_boxes")
question11 = Question.create!(order: 2, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "S'appuie sur des investigations complémentaires ?", information: "presence_ic", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question12 = Question.create!(order: 3, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie des zones de doutes, à risques (coudes, croisements, branchements) ?", information: "presence_doutes", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question13 = Question.create!(order: 4, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Suit le code couleur règlementaire ?", information: "couleurs_reglementaires", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question14 = Question.create!(order: 5, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise l'axe présumé des ouvrages ?", information: "axe", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question15 = Question.create!(order: 6, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise la zone d'emprise d'un ou plusieurs ouvrages ?", information: "emprise", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question16 = Question.create!(order: 7, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Identifie les profondeurs de l'ouvrage ?", information: "profondeur", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")
question17 = Question.create!(order: 8, section: Section.find_by(name: "Recommandations et localisations des ouvrages"), name: "Matérialise la classe de précision ?", information: "precision", option_group: OptionGroup.find_by(name: "groupe 1"), input_type: "option_choice_id", active: true, display: "radio_buttons")

Section.find((4..10).to_a).each do |section|
question10d = Question.create!(order: 1, section: section, name: "Concessionnaire :", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true)
question10a = Question.create!(order: 2, section: section, name: "Classe de réseaux :", option_group: OptionGroup.find_by(name: "groupe 4"), input_type: "option_choice_id", active: true, display: "check_boxes")
question10b = Question.create!(order: 3, section: section, name: "Commentaire sur la DICT :", option_group: OptionGroup.find_by(name: "groupe 5"), input_type: "option_choice_id", active: true, display: "check_boxes")
question10c = Question.create!(order: 4, section: section, name: "Avis du technicien :", option_group: OptionGroup.find_by(name: "groupe 6"), input_type: "option_choice_id", active: true, display: "check_boxes")
end

question18 = Question.create!(order: 1, section: Section.find_by(name: "Signataires"), name: "Remarques du rédacteur :", information: "remarques_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "text")
question19 = Question.create!(order: 2, section: Section.find_by(name: "Signataires"), name: "Durée de l'intervention :", information: "duree_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "integer")
question20 = Question.create!(order: 3, section: Section.find_by(name: "Signataires"), name: "Observations des parties :", information: "observations_mp", option_group: OptionGroup.find_by(name: "groupe 0"), input_type: "string", active: true, display: "text")
puts "Questions créées: #{Question.count}"

Product.all.each do |product|
  Question.all.each do |q|
    ProductQuestion.create(product: product, question: q)
  end
end

puts "ProductQuestions: #{ProductQuestion.count}"
