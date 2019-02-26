# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts "Creating Restaurants"
# 5.times do 
# Restaurant.create!(
#     name: Faker::Name.name,
#     address: Faker::Address.street_address,
#     category: Restaurant::CATEGORIES.sample,
#     phone_number: Faker::PhoneNumber.phone_number
# )
# end
# puts "Finished creating restaurants"
require 'faker'

puts "Creating Shops"
  3.times do
    Shop.create!(
      shop_name: Faker::Company.name,
      owner_name: Faker::Name.name,
      address: Faker::Address.street_address,
      description: ["Fades", "Buzzcut", "Crewcut", "Pompadour"],
      open_at: Faker::Number.number(1),
      close_at: Faker::Number.number(1),
      photo: Faker::Avatar.image,
      url: ["http://www.cutit.co.jp/", "https://www.goldsalontokyo.com/", "http://barberboys.jp/"].sample,
      phone_number: Faker::PhoneNumber.phone_number,
      logo: Faker::Avatar.image,
      email: Faker::Internet.email,
      password: Faker::Games::Pokemon.name
    )
  
end
puts "Finished creating shops"

puts "Creating Barbers"
Shop.find_each do |shop|
  puts "Barbers"
  3.times do 
    Barber.create!(
      name: Faker::Name.name,
      shop: shop,
      age: Faker::Number.number(2),
      gender: Faker::Gender.binary_type,
      languages: ["English", "Japanese", "Spanish"].sample,
      description: ["Fades", "Buzzcut", "Crewcut"].sample,
      avatar: Faker::Avatar.image
    )
  end 
end
puts "Finished creating barbers"

puts "Creating user"
  3.times do
    User.create!(
      name: Faker::Name.name,
      avatar: Faker::Avatar.image,
      age: Faker::Number.number(2),
      gender: Faker::Gender.binary_type,
      address: Faker::Address.street_address,
      languages: ["English", "Japanese", "Spanish"].sample,
      email: Faker::Internet.email,
      password: Faker::Games::Heroes.name
    )
  
end
puts "Finished creating users"

puts "Creating appointments"
Barber.find_each do |barber|
  puts "Appointments"
  3.times do 
    Appointment.create!(
      scheduled_at: Faker::Date.between(2.days.ago, Date.today),
      state: ["Pending", "Approved", "Denied"].sample,
      description: ["Fades", "Buzzcut", "Crewcut"].sample,
      photo: Faker::Avatar.image,
      barber: barber,
      user: User.all.sample
    )
  end
end
puts "Finished creating appointments"