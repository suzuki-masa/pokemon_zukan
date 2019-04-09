module Types
  class MutationType < Types::BaseObject
    field :updateMonster, mutation: Mutations::UpdateMonster
    field :createMonster, mutation: Mutations::CreateMonster
  end
end
