# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create(first_name: "Sebastien", 
#			last_name: "Thomas", 
#			email: "titbabthomas@gmail.com", 
#			address: "10314 Strathmore Hall Street Apt 203, North Bethesda, MD 20852",
#			password: "admin123", 
#			password_confirmation: "admin123", 
#			admin:true,
 #           activated: true,
  #          activated_at: Time.zone.now)
			
#User.create(first_name: "Samantha", 
#			last_name: "Louis", 
#			email: "samanthalouis.12@gmail.com", 
#			address: "1611 Pine St, New Orleans, LA 70118",
#			password: "admin123", 
#			password_confirmation: "admin123", 
#			admin:true,
#           activated: true,
#            activated_at: Time.zone.now)

#49.times do |n|
#  first_name  = Faker::Name.first_name
#  last_name  = Faker::Name.last_name
#  email = "example-#{n+1}@dummy.org"
#  password = "password"
#  User.create!(first_name:  first_name,
#  			   last_name:  last_name,
#               email: email,
#               password: password,
#               password_confirmation: password)
#end

#Table.delete_all
#Table.create(number:0, capacity: 2)
#19.times do |n|
# Table.create(number: n+1, capacity: 14)
#end

Picture.delete_all
#add beaches
Picture.create(name: "Labadee Beach, Haiti", url: "beach/Labadee_Beach_Labadee_Haiti.jpeg", theme: 0, table_id: nil)
Picture.create(name: "Baia do Sancho ,  Brazil ", url: "beach/Baia_do_Sancho_Fernando_de_Noronha_Brazil.jpeg", theme: 0, table_id: Table.find_by_number(1))
Picture.create(name: "Grace Bay ,  Turks and Caicos", url: "beach/Grace_Bay_Providenciales_Turks_and_Caicos.jpeg", theme: 0, table_id: Table.find_by_number(2))
Picture.create(name: "Rabbit Beach ,  Islands of Sicily ", url: "beach/Rabbit_Beach_Lampedusa_Islands_of_Sicily.jpeg", theme: 0, table_id: Table.find_by_number(3))
Picture.create(name: "Playa Paraiso ,  Cuba ", url: "beach/Playa_Paraiso_Cayo_Largo_Cuba.jpeg", theme: 0, table_id: Table.find_by_number(4))
Picture.create(name: "Playa de Ses Illetes ,  Balearic Islands ", url: "beach/Playa_de_Ses_Illetes_Formentera_Balearic_Islands.jpeg", theme: 0, table_id: Table.find_by_number(5))
Picture.create(name: "Anse Lazio ,  Seychelles", url: "beach/Anse_Lazio_Praslin_Island_Seychelles.jpeg", theme: 0, table_id: Table.find_by_number(6))
Picture.create(name: "White Beach ,  Aklan Province ", url: "beach/White_Beach_Boracay_Aklan_Province.jpeg", theme: 0, table_id: Table.find_by_number(7))
Picture.create(name: "Flamenco Beach ,  Puerto Rico ", url: "beach/Flamenco_Beach_Culebra_Puerto_Rico.jpeg", theme: 0, table_id: Table.find_by_number(8))
Picture.create(name: "Whitehaven Beach ,  Whitsunday Islands", url: "beach/Whitehaven_Beach_Whitsunday_Island_Whitsunday_Islands.jpeg", theme: 0, table_id: Table.find_by_number(9))
Picture.create(name: "Elafonissi Beach ,  Greece ", url: "beach/Elafonissi_Beach_Elafonissi_Greece.jpeg", theme: 0, table_id: Table.find_by_number(10))
Picture.create(name: "Camps Bay Beach ,  South Africa ", url: "beach/Camps_Bay_Beach_Camps_Bay_South_Africa.jpeg", theme: 0, table_id: Table.find_by_number(11))
Picture.create(name: "Woolacombe Beach ,  United Kingdom ", url: "beach/Woolacombe_Beach_Woolacombe_United_Kingdom.jpeg", theme: 0, table_id: Table.find_by_number(12))
Picture.create(name: "Siesta Beach ,  Florida ", url: "beach/Siesta_Beach_Siesta_Key_Florida.jpeg", theme: 0, table_id: Table.find_by_number(13))
Picture.create(name: "West Bay Beach ,  Honduras ", url: "beach/West_Bay_Beach_West_Bay_Honduras.jpeg", theme: 0, table_id: Table.find_by_number(14))
Picture.create(name: "Cayo de Agua ,  Venezuela ", url: "beach/Cayo_de_Agua_Los_Roques_National_Park_Venezuela.jpeg", theme: 0, table_id: Table.find_by_number(15))
Picture.create(name: "Playa Manuel Antonio ,  Costa Rica ", url: "beach/Playa_Manuel_Antonio_Manuel_Antonio_National_Park_Costa_Rica.jpeg", theme: 0, table_id: Table.find_by_number(16))
Picture.create(name: "Nai Harn Beach ,  Thailand ", url: "beach/Nai_Harn_Beach_Nai_Harn_Thailand.jpeg", theme: 0, table_id: Table.find_by_number(17))
Picture.create(name: "Sharm El Luli ,  Egypt ", url: "beach/Sharm_El_Luli_Marsa_Alam_Egypt.jpeg", theme: 0, table_id: Table.find_by_number(18))
Picture.create(name: "Iztuzu Beach ,  Turkey ", url: "beach/Iztuzu_Beach_Dalyan_Turkey.jpeg", theme: 0, table_id: Table.find_by_number(19))

#add destinations
Picture.create(name: "Cap Haitien, Haiti", url: "destination/CapHaitien_Haiti.png", theme: 1, table_id: Table.find_by_number(0))
Picture.create(name: "Marrakech, Morocco", url: "destination/Marrakech_Morocco.png", theme: 1, table_id: Table.find_by_number(1))
Picture.create(name: "Siem Reap, Cambodia", url: "destination/Siem_Reap_Cambodia.png", theme: 1, table_id: Table.find_by_number(2))
Picture.create(name: "Istanbul, Turkey", url: "destination/Istanbul_Turkey.png", theme: 1, table_id: Table.find_by_number(3))
Picture.create(name: "Hanoi, Vietnam", url: "destination/Hanoi_Vietnam.png", theme: 1, table_id: Table.find_by_number(4))
Picture.create(name: "Prague, Czech Republic", url: "destination/Prague_Czech_Republic.png", theme: 1, table_id: Table.find_by_number(5))
Picture.create(name: "London, United Kingdom", url: "destination/London_United_Kingdom.png", theme: 1, table_id: Table.find_by_number(6))
Picture.create(name: "Rome, Italy", url: "destination/Rome_Italy.png", theme: 1, table_id: Table.find_by_number(7))
Picture.create(name: "Buenos Aires, Argentina", url: "destination/Buenos_Aires_Argentina.png", theme: 1, table_id: Table.find_by_number(8))
Picture.create(name: "Paris, France", url: "destination/Paris_France.png", theme: 1, table_id: Table.find_by_number(9))
Picture.create(name: "Cape Town Central, South Africa", url: "destination/Cape_Town_Central_South_Africa.png", theme: 1, table_id: Table.find_by_number(10))
Picture.create(name: "New York City, United States", url: "destination/New_York_City_United_States.png", theme: 1, table_id: Table.find_by_number(11))
Picture.create(name: "Zermatt, Switzerland", url: "destination/Zermatt_Switzerland.png", theme: 1, table_id: Table.find_by_number(12))
Picture.create(name: "Barcelona, Spain", url: "destination/Barcelona_Spain.png", theme: 1, table_id: Table.find_by_number(13))
Picture.create(name: "Goreme, Turkey", url: "destination/Goreme_Turkey.png", theme: 1, table_id: Table.find_by_number(14))
Picture.create(name: "Ubud, Indonesia", url: "destination/Ubud_Indonesia.png", theme: 1, table_id: Table.find_by_number(15))
Picture.create(name: "Cusco, Peru", url: "destination/Cusco_Peru.png", theme: 1, table_id: Table.find_by_number(16))
Picture.create(name: "St. Petersburg, Russia", url: "destination/St_Petersburg_Russia.png", theme: 1, table_id: Table.find_by_number(17))
Picture.create(name: "Rio de Janeiro, Brasil", url: "destination/Rio_de_Janeiro_Brasil.png", theme: 1, table_id: Table.find_by_number(18))
Picture.create(name: "Tokyo, Japan", url: "destination/Tokyo_Japan.png", theme: 1, table_id: Table.find_by_number(19))