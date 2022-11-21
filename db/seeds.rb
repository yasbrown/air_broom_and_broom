require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting all broomstick records"
Broomstick.destroy_all

10.times do
  broomstick = Broomstick.create(
    name: Faker::Movies::HarryPotter.spell,
    rating: rand(1..5)
  )
  puts "Broomstick with id #{broomstick.id} has been created"
end

puts "Finished!"
