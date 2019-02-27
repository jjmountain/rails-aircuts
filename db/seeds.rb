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


DESCRIPTIONS = ["Just off the severely beaten cobbles of Carnaby Street lies Pankhurst, a haven for gentlemen who like their haircuts timeless and classic. Wait for your turn in the barber seat flicking through chunky coffee table mags in the basement conservatory, before choosing between a classic cut, wet shave or hot-towel massage.", "For an authentic Turkish barbering experience without having to set foot outside of London, try one of Ted’s Grooming Room’s 11 city-centre locations.", "A DJ turned barber to the stars, Joe Mills is a man who knows his way around a pair of scissors better than most.", "Producing its own range of acclaimed fragrances, creams and potions, Murdock is more than just a barber shop – it’s a grooming empire", "When the likes of Dizzee Rascal, Anthony Joshua, Tinie Tempah and Reggie Yates are after a flawless fade, there’s only one place in town they’ll go.", "If you’re not a fan of the whole ‘ye olde barber shop’ vibe that a lot of outposts seem hellbent on perpetuating, the sleek, modern styling of Farringdon’s Manifesto might be more to your liking.", "Located just off the East End’s bustling Brick Lane lies Nomad, an award-winning barber shop that lives up to its name.", "A bright and breezy space with industrial touches and an on-site coffee shop – Aveda Men isn’t what you might call your typical London barber shop. And that extends to more than just the decor."]

SHOPNAMES = ["Pankhurst", "Ted’s Grooming Room", "Joe and Co.", "Murdock London", "Slider Cuts", "Manifesto", "Nomad Barber", "Aveda"]

ADDRESSES = ['Soho', 'Charing Cross', 'Soho', 'Covent Garden', 'Holloway', 'Farringdom', 'Shoreditch', 'Covent Gard']

IMAGES = ['shop_0.jpg', 'shop_1.jpg', 'shop_2.jpg', 'shop_3.jpg', 'shop_4.jpg', 'shop_5.jpg', 'shop_6.jpg', 'shop_7.jpg']

puts "Creating Shops"
  3.times do
    sampled_number = Array(0..7).sample
    Shop.create!(
      shop_name: SHOPNAMES[sampled_number],
      owner_name: Faker::Name.name,
      address: ADDRESSES[sampled_number],
      description: DESCRIPTIONS[sampled_number],
      open_at: Faker::Number.number(1),
      close_at: Faker::Number.number(1),
      photo: IMAGES[sampled_number],
      url: ["http://www.cutit.co.jp/", "https://www.goldsalontokyo.com/", "http://barberboys.jp/"].sample,
      phone_number: Faker::PhoneNumber.phone_number,
      logo: Faker::Avatar.image,
      email: Faker::Internet.email,
      password: 'secret'
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
      password: 'secret'
    )

end
puts "Finished creating users"

puts "Creating appointments"
Barber.find_each do |barber|
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
