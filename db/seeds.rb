# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dream.destroy_all
Dreamsign.destroy_all

Dreamsign.create(name: "Running",
                 description: "You are running away for something, you don't know what. It's dangerous.")
Dreamsign.create(name: "Hurry",
                 description: "You're hurrying to the airport to catch your flight.")

20.times do |i|
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph(7)
  date = Faker::Time.forward(20)
  lucid = (i > 10 ? true : false)
  Dream.create( name: name,
                description: description,
                date: date,
                lucid: lucid)
end

puts "Created #{Dream.count} books!"
puts "Created #{Dreamsign.count} dreamsigns!"