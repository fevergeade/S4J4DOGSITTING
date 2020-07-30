# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
JoinTableStrollDog.destroy_all
Stroll.destroy_all
Dog.destroy_all
Dogsitter.destroy_all
City.destroy_all

puts "je commence a peupler la base de donnée"
5.times do
  City.create(city_name: Faker::Address.city)
end
puts "j'ai créé des villes"
tp City.all

10.times do
  Dogsitter.create(
    name: Faker::Name.last_name,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end
puts "j'ai créé des promenneurs de chiens"
tp Dogsitter.all

10.times do
  Dog.create(
    name: Faker::Creature::Dog.name,
    race: Faker::Creature::Dog.breed,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

puts "j'ai créé des chiens"
tp Dog.all

5.times do
  Stroll.create(
    date: Faker::Date.forward(days: 23),
    dogsitter_id: Dogsitter.find(rand(Dogsitter.first.id..Dogsitter.last.id)).id
  )
end

puts "j'ai créé des évenements de sortie"
tp Stroll.all

Stroll.all.each do |stroll|
  puts stroll
  rand(1..5).times do
    puts stroll.id
    JoinTableStrollDog.create(
      stroll_id: stroll.id,
      dog_id: Dog.find(rand(Dog.first.id..Dog.last.id)).id
    )
  end
end

puts "Pour chaque évement, j'ai rattaché 1 ou 5 chiens"
tp JoinTableStrollDog.all
