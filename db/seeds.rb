# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product1 = Product.new({ name:"iPhone", price:"1600", description:"iPhone 64gb XS15"})
product2 = Product.new({ name:"TV", price:"600", description:"Vizio 4k TV"})

product1.save
product2.save

puts Product.count
p product1