require 'faker'

FactoryGirl.define do
  factory :dream do
    #curly braces are considered by factorygirl as 'lazy attributes'
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph(7) }
  end
end