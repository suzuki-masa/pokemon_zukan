# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Faker::Config.locale = :ja

# 生息地を30件登録する
locations = []
30.times do
  locations << Location.create(name:  Faker::Games::Pokemon.location)
end

# わざを50個登録する
moves = []
30.times do
  moves << Move.create(name:  Faker::Games::Pokemon.move)
end

# モンスターを50体登録する
50.times do
  monster = Monster.create(
    name: Faker::Games::Pokemon.name,
    location_id: locations.sample.id
  )

  # モンスターとわざの対応を用意する
  4.times do
    MonstersMove.create(
      monster_id: monster.id,
      move_id: moves.sample.id
    )
  end
end



