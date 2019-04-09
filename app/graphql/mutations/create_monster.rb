module Mutations
  class CreateMonster < GraphQL::Schema::RelayClassicMutation
    argument :name, String, required: true
    argument :move_ids, [Integer], required: true
    argument :location_id, Integer, required: true

    field :monster, Types::MonsterType, null: false

    def resolve(name:, move_ids:, location_id:)
      monster = Monster.new(
        name: name,
        move_ids: move_ids,
        location_id: location_id
      )

      monster.save!
      { monster: monster }
    end
  end
end
