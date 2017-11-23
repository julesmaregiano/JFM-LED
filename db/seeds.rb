# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Availabilities.destroy_all
Bookings.destroy_all

particulier = User.create!(email: "particulier@led.fr", password: "123soleil", first_name: "Parti", last_name: "Culier", phone:"06 11 22 33 44", role:0)
pro = User.create!(email: "pro@led.fr", password: "123soleil", first_name: "Pro", last_name: "Fessionnel", phone:"06 11 22 33 44", role:1)
technician = User.create!(email: "tech@led.fr", password: "123soleil", first_name: "Tech", last_name: "Nician", phone:"06 11 22 33 44", role:2)
manager = User.create!(email: "manager@led.fr", password: "123soleil", first_name: "Ma", last_name: "Nager", phone:"06 11 22 33 44", role:3)
admin = User.create!(email: "admin@led.fr", password: "123soleil", first_name: "Ad", last_name: "Min", phone:"06 11 22 33 44", role:4)
puts "#{User.all.size} Users créés."


next_25 = (1..25).to_a
next_25.each do |numero|
  User.all.where(role: 1).each do |user|
    date = numero.business_days.from_now
    hours = [8, 14]
    Availability.find_or_create_by(user_id: user.id, date: Time.new(date.year, date.month, date.day, hours[0], 0, 0, 0) )
    Availability.find_or_create_by(user_id: user.id, date: Time.new(date.year, date.month, date.day, hours[1], 0, 0, 0) )
  end
puts "#{Availabilities.all.size} Availabilities créées."
