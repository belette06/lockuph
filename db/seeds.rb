# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Proprietor.destroy_all

(1..10).to_a.each do |i|
  puts "Creating User #{i}"
  User.create!(
      email: "#{Faker::Internet.unique.username}@yopmail.com",
      password: "password"
  )
end

(1..10).to_a.each do |i|
 puts "proprietor create #{i}"
  Proprietor.create!(
      phone: "#{Faker::Number.number(10)}",
      address: "#{Faker::Name.first_name}"

  )
end



