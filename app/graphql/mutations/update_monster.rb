module Mutations
  class UpdateMonster < GraphQL::Schema::RelayClassicMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :move_ids, [Integer], required: true
    argument :location_id, Integer, required: true

    field :monster, Types::MonsterType, null: false

    def resolve(id:, name:, move_ids:, location_id:)
      monster = Monster.find(id)
      monster.update(
        name: name,
        move_ids: move_ids,
        location_id: location_id
      )
      { monster: monster }
    end
  end
end
