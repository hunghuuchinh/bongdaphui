# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "hungba",
             email: "hungbka2010@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             phone: "01676571863",
             role: "admin")
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  phone ="1234567890"
  User.create!(name:  name,
               email: email,
               phone: phone,
               password:              password,
               password_confirmation: password)
end

"Puts create 100 Pitchs"
100.times do |n|
  name = Faker::Name.name
  Pitch.create!(name: name)
end
