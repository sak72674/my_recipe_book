# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "saori", email: "demo@demo", password: "111111")

Genre.create!(name: "肉")
Genre.create!(name: "魚")
Genre.create!(name: "野菜")
Genre.create!(name: "麺")
Genre.create!(name: "その他")
Genre.create!(name: "おやつ")

