# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Sebastien", 
			last_name: "Thomas", 
			email: "titbabthomas@gmail.com", 
			address: "10314 Strathmore Hall Street Apt 203, North Bethesda, MD 20852",
			password: "admin123", 
			password_confirmation: "admin123", 
			admin:true,
            activated: true,
            activated_at: Time.zone.now)
			
User.create(first_name: "Samantha", 
			last_name: "Louis", 
			email: "samanthalouis.12@gmail.com", 
			address: "1611 Pine St, New Orleans, LA 70118",
			password: "admin123", 
			password_confirmation: "admin123", 
			admin:true,
            activated: true,
            activated_at: Time.zone.now)

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