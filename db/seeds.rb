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
puts "destroyed"
  user = User.create(
    email: Faker::Internet.email,
    username: Faker::Internet.user,
    password: Faker::Internet.password
  )

  Broomstick.create(
    name: "Harry",
    stability: 2,
    speed: 3,
    price: 100,
    user: user,
    description: "The best one",
    address: "30 rue hoche, france",
    photo: "https://www.microminiatures.co.uk/wp-content/uploads/2021/06/03487.jpg"
  )
  Broomstick.create(
    name: "Nancy",
    stability: 3,
    speed: 1,
    price: 500,
    user: user,
    description: "Enjoy you trip",
    address: "hoxton, england",
    photo: "https://images.partydelights.co.uk/PROP/22/7/front/v4/fac/4.jpg"
  )
  Broomstick.create(
    name: "Tere",
    stability: 1,
    speed: 3,
    price: 200,
    user: user,
    description: "Hello",
    address: "buenos aires, argentina",
    photo: "https://static9.depositphotos.com/1328797/1188/i/600/depositphotos_11882309-stock-photo-senior-woman-broom.jpg"
  )

puts "Finished!"
