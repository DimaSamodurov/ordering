# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'example@example.com', password: 'example', password_confirmation: 'example' )

Product.create! id: 223, name: "Banana", price: 2, previous_price: "5" 
Product.create! id: 322, name: "Apple", price: 4
Product.create! id: 332, name: "Carton of Strawberries", price: 1.99
