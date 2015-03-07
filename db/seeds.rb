# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dream.destroy_all

20.times do
  name = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph(7)
  date = Faker::Time.forward(20)
  Dream.create( name: name,
                description: description,
                date: date)
end

puts "Created #{Dream.count} books!"