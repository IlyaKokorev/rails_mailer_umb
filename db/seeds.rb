# frozen_string_literal: true

require 'faker'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

DatabaseCleaner.clean

100_000.times do
  User.create!({ name: Faker::Name.unique.name, email: Faker::Internet.unique.email })
end

10.times do
  User.create!({ name: Faker::Name.unique.name, email: Faker::Name.unique.name })
end
