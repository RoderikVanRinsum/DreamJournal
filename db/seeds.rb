# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dream.destroy_all
Dreamsign.destroy_all

running = Dreamsign.create!(name: "Running",
                 description: "You are running away for something, you don't know what. It's dangerous.")
hurry = Dreamsign.create!(name: "Hurry",
                 description: "You're hurrying to the airport to catch your flight.")
closed_eyes = Dreamsign.create!(name: "Eyes closed",
                                description: "You're trying to open your eyes, but it's impossible.")

50.times do |i|
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph(7)
  date = Faker::Time.backward(60)
  lucid = (rand > 0.5 ? true : false)
  signs = (rand < 0.5 ? [running] : [running, hurry, closed_eyes] )
  Dream.create( name: name,
                description: description,
                date: date,
                lucid: lucid,
  dreamsigns: signs)
end

puts "Created #{Dream.count} books!"
puts "Created #{Dreamsign.count} dreamsigns!"