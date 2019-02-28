require "json"
require "http"
require "optparse"
require "faker"


# Place holders for Yelp Fusion's API key. Grab it
# from https://www.yelp.com/developers/v3/manage_app
API_KEY = "L0XyFjJHL4FvmF6-gX-RjFkWr4rQkRK-hzgbtOjimqww873_yg7H87OmI_TF9YmHlWFO_zlWyaXUcX8qn17kITKmbJjtvVtiGenykJNWqjwfRB6_D_HYt8K3MHN2XHYx"


# Constants, do not change these
API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path


DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francisco, CA"
SEARCH_LIMIT = 1


# Make a request to the Fusion search endpoint. Full documentation is online at:
# https://www.yelp.com/developers/documentation/v3/business_search
#
# term - search term used to find businesses
# location - what geographic location the search should happen
#
# Examples
#
#   search("burrito", "san francisco")
#   # => {
#          "total": 1000000,
#          "businesses": [
#            "name": "El Farolito"
#            ...
#          ]
#        }
#
#   search("sea food", "Seattle")
#   # => {
#          "total": 1432,
#          "businesses": [
#            "name": "Taylor Shellfish Farms"
#            ...
#          ]
#        }
#
# Returns a parsed json object of the request
def search(category, location, offset)
  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    categories: category,
    location: location,
    limit: 50,
    offset: offset
  }

  response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
  response.parse
end


# Look up a business by a given business id. Full documentation is online at:
# https://www.yelp.com/developers/documentation/v3/business
#
# business_id - a string business id
#
# Examples
#
#   business("yelp-san-francisco")
#   # => {
#          "name": "Yelp",
#          "id": "yelp-san-francisco"
#          ...
#        }
#
# Returns a parsed json object of the request
def business(business_id)
  url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"

  response = HTTP.auth("Bearer #{API_KEY}").get(url)
  response.parse
end

def reviews(business_id)
  url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"

  response = HTTP.auth("Bearer #{API_KEY}").get(url)
  response.parse
end


options = {}
OptionParser.new do |opts|
  opts.banner = "Example usage: ruby sample.rb (search|lookup) [options]"

  opts.on("-tTERM", "--term=TERM", "Search term (for search)") do |term|
    options[:term] = term
  end

  opts.on("-lLOCATION", "--location=LOCATION", "Search location (for search)") do |location|
    options[:location] = location
  end

  opts.on("-bBUSINESS_ID", "--business-id=BUSINESS_ID", "Business id (for lookup)") do |id|
    options[:business_id] = id
  end

  opts.on("-h", "--help", "Prints this help") do
    puts opts
    exit
  end
end.parse!


command = ARGV


case command.first
when "search"
  term = options.fetch(:term, DEFAULT_TERM)
  location = options.fetch(:location, DEFAULT_LOCATION)

  raise "business_id is not a valid parameter for searching" if options.key?(:business_id)

  response = search(term, location)

  puts "Found #{response["total"]} businesses. Listing #{SEARCH_LIMIT}:"
  response["businesses"].each {|biz| puts biz["name"]}
when "lookup"
  business_id = options.fetch(:business_id, DEFAULT_BUSINESS_ID)


  raise "term is not a valid parameter for lookup" if options.key?(:term)
  raise "location is not a valid parameter for lookup" if options.key?(:lookup)

  response = business(business_id)

  puts "Found business with id #{business_id}:"
  puts JSON.pretty_generate(response)
else
  puts "Please specify a command: search or lookup"
end

offset = 0

puts "Creating Shops"

2.times do
# running this returns 50 barber businesses in Tokyo from yelp
  parsed_json = search("barbers,menshair", "Japan", offset)
  parsed_json["businesses"].each do | b |
    shop = Shop.create!(
      yelp_id: b["id"],
      shop_name: b["name"],
      owner_name: Faker::Name.name,
      email: Faker::Internet.email,
      address: b["location"]["display_address"].join(" "),
      latitude: b["coordinates"]['latitude'],
      longitude: b["coordinates"]['longitude'],
      rating: b["rating"],
      url: b["url"],
      price: b["price"].to_s,
      phone_number: b["phone"],
      photo: b["image_url"],
      password: 'secret',
      )
  end
  offset += 50
end

puts "Creating Barbers"
Shop.find_each do |shop|
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
# puts business(parsed_json["businesses"].first["id"])
# puts reviews(parsed_json["businesses"].first["id"])["reviews"].first["text"]

# puts 'creating shops'

