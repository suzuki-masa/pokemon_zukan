module Types
  class MonsterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :moves, [MoveType], null: false
    field :location, LocationType, null: false
  end
end
