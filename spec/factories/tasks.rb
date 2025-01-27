require 'faker'

FactoryBot.define do
  factory :task do
    title { Faker::Name.name }
    description { Faker::Lorem.sentence }
    status { %w[pending in_progress completed].sample }
  end
end
