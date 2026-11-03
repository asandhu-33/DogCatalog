require 'open-uri'
require 'json'

# Clear existing data to avoid duplicates
Breed.destroy_all
Shelter.destroy_all

puts "Creating shelters with Faker..."
shelters = []
10.times do
  shelters << Shelter.create!(
    name: Faker::Company.name + " Animal Rescue",
    city: "Winnipeg",
    contact_email: Faker::Internet.email
  )
end

puts "Fetching dog breeds and images from Dog CEO API..."
url = 'https://dog.ceo/api/breeds/list/all'
buffer = URI.open(url).read
data = JSON.parse(buffer)
breed_list = data['message']

count = 0
breed_list.each do |breed_name, sub_breeds|
  img_url = "https://images.dog.ceo/breeds/#{breed_name}/n02087394_1.jpg"
  begin
    img_buffer = URI.open("https://dog.ceo/api/breed/#{breed_name}/images/random").read
    img_data = JSON.parse(img_buffer)
    img_url = img_data['message'] if img_data['status'] == 'success'
  rescue
   
  end

  Breed.create!(
    name: breed_name.capitalize,
    bred_for: "Companion / Working",
    life_span: "10 - 15 years",
    image_url: img_url,
    shelter: shelters.sample
  )
  count += 1
end

(200 - count).times do
  Breed.create!(
    name: Faker::Creature::Dog.breed,
    bred_for: Faker::Creature::Dog.meme_phrase,
    life_span: "12 years",
    image_url: "https://images.dog.ceo/breeds/retriever-golden/n02099601_3000.jpg",
    shelter: shelters.sample
  )
end

puts "Seeding finished! Created #{Shelter.count} shelters and #{Breed.count} breeds."