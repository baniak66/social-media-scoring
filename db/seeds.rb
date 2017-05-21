# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeds: start"

# puts "Create users"
# 100.times do
#   Client.create!(
#     email: Faker::Internet.email,
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     phone: Faker::PhoneNumber.subscriber_number(9)
#   )
# end

puts "Create users likes"
clients = Client.all
clients.each do |client|
  15..25.times do
    client.likes.create!(
      content: Faker::Lorem.sentence
    )
  end
end

puts "Add important likes"
important = SmarterCSV.process(Rails.root + "public/dictionary.csv")
important.each do |imp|
  ImportantLike.create!(
    content: imp[:fanpage],
    fin: imp[:fin],
    mat: imp[:doj],
    gro: imp[:grow],
    hip: imp[:hipo]
  )
end

puts "Assign important likes to clients"

important_links = ImportantLike.all
clients.each do |client|
  ((2..10).to_a).sample.times do
    like = important_links.sample
    client.likes.create!(
      content: like.content
    )
  end
end


puts "Seeds: completed"
