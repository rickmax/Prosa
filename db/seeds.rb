# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
    Propostum.create(
        nome: Faker::StarWars.character,
        descricao: Faker::Lorem.paragraph(2),
        valor: Faker::Number.decimal(2),
        inicio: Faker::Date.between(10.days.ago, Date.today),
        fim: Faker::Date.forward(10),
        estado: Faker::Address.state,
        cidade: Faker::Address.city
    )
end
