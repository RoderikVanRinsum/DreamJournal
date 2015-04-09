require 'faker'

FactoryGirl.define do
  factory :dream do |f|
    #curly braces are considered by factorygirl as 'lazy attributes'
    f.name { Faker::Lorem.sentence }
    f.description { Faker::Lorem.paragraph(7) }
  end
end