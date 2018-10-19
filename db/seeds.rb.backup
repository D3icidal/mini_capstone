# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all

product1 = Product.new({ name:"iPhone", price:"1600.99", description:"iPhone 64gb XS15", stock:true})
product2 = Product.new({ name:"TV", price:"600", description:"Vizio 4k TV", stock:true})
product3 = Product.new({ name:"cooler tv", price:"1600", description:"Vizio 20k TV", stock:true})

product1.save
product2.save
product3.save

puts "Freshly seeded. current product count #{Product.count}"
p product1