# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database"
Order.destroy_all
Pool.destroy_all
User.destroy_all

puts"Creating Users"

User_Maria = User.create!(email: "maria@terra.com.br", password: "1234fgh")

puts"Creating Pools"


Julio_Delamare = Pool.new(user: User_Maria, name: "Parque Aquático Julio Delamare", size: 100, price: 200_000, address: "Av. Maracanã, 12 - Maracanã, Rio de Janeiro", capacity: 10)
Julio_Delamare.save!

Ofuro_Vidigal = Pool.new(user: User_Maria, name: "Ofurô no Vigigal", size: 2, price: 20_000, address: "Rua Maria Quitéria, 27, Ipanema, Rio de Janeiro", capacity: 20)
Ofuro_Vidigal.save!

Piscina_Luxo_Jardins = Pool.new(user: User_Maria, name: "Piscina Luxo no Jardins", size: 50, price: 150_000, address: "Rua Vittorio Fasano, 88, São Paulo", capacity: 5)
Piscina_Luxo_Jardins.save!

Piscina_bowl_skate = Pool.new(user: User_Maria, name: "Piscina bowl para skate", size: 50, price: 30_000, address: "Av. Queiroz Filho, 1365 Vila Hamburguesa, São Paulo", capacity: 5)
Piscina_bowl_skate.save!

Piscina_borda_infinita = Pool.new(user: User_Maria, name: "Piscina borda infinita Ilha Bela", size: 20, price: 50_000, address: "Rua Gassipos 66, Vila Mariana, São Paulo", capacity: 20)
Piscina_borda_infinita.save!

puts "Finished!"
