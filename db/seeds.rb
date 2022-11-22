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

5.times do
  user = User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user,
    password: Faker::Internet.password
  )

  2.times do
    broomstick = Broomstick.create(
      name: Faker::Movies::HarryPotter.spell,
      stability: rand(1..3),
      speed: rand(1..3),
      price: rand(100..1000),
      user: user
    )
    puts "Broomstick with id #{broomstick.id} has been created"
    puts "User with id #{user.id} has been created"
  end
end

puts "Finished!"
