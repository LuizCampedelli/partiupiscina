# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning the database"
Pool.destroy_all
User.destroy_all

puts"Creating Users"

User_Maria = User.create!(email: "maria@terra.com.br", password: "1234fgh")

puts"Creating Pools"


Julio_Delamare = Pool.new(user: User_Maria, name: "Parque Aquático Julio Delamare", size: 100, price: 200_000, address: "Av. Maracanã, 12 - Maracanã, Rio de Janeiro")
Julio_Delamare.save!

Ofuro_Vidigal = Pool.new(user: User_Maria, name: "Ofurô no Vigigal", size: 2, price: 20_000, address: "R. Armando Almeida Lima, 8 - Vidigal, Rio de Janeiro")
Ofuro_Vidigal.save!

Piscina_Luxo_Jardins = Pool.new(user: User_Maria, name: "Piscina Luxo no Jardins", size: 50, price: 150_000, address: "Rua Vittorio Fasano, 88, São Paulo")
Piscina_Luxo_Jardins.save!

Piscina_bowl_skate = Pool.new(user: User_Maria, name: "Piscina bowl para skate", size: 50, price: 30_000, address: "Av. Queiroz Filho, 1365 Vila Hamburguesa, São Paulo")
Piscina_bowl_skate.save!

Piscina_borda_infinita = Pool.new(user: User_Maria, name: "Piscina borda infinita Ilha Bela", size: 20, price: 50_000, address: "Rua Jackson de Figueiredo 501, Joatinga, Rio de Janeiro")
Piscina_borda_infinita.save!

puts "Finished!"
