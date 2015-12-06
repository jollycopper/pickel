# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Yayi Xu",
             email: "yayixu90@gmail.com",
             password:              "password",
             password_confirmation: "password")

30.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.free_email
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

40.times do |n|
  title = Faker::Hacker.adjective + ' ' + Faker::Hacker.noun
  term = rand(0...3)
  instructor  = Faker::name.name
  year = rand(2014...2016)
  quantity = rand(30...100)
  description = Faker::Lorem.paragraph
  Course.create!(instructor: instructor,
                 term: term,
                 title: title,
                 year: year,
                 description: description,
                 quantity: quantity)
end

test_user = User.first
courses = Course.all[20...22]
courses.each { |course| test_user.select(course)}
