module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # ポケモン単体取得
    field :monster, Types::MonsterType, null: false do
      argument :id, ID, required: true
    end
    def monster(id:)
      Monster.find(id)
    end

    # わざ一覧
    field :moves, Types::MoveType.connection_type, null: false, resolve: -> (_object, _args, _context) do
      Move.all
    end

    # 生息地一覧
    field :locations, Types::LocationType.connection_type, null: false, resolve: -> (_object, _args, _context) do
      Location.all
    end

    # ポケモン一覧
    field :monsters, Types::MonsterType.connection_type, null: false, resolve: -> (_object, _args, _context) do
      Monster.all
    end


    # _object, _args, _context について
    #
    # _object: 自身のオブジェクト。MoveTypeだったら move の情報が入っている
    # _args: fieldに渡す引数
    # _ctx: ログインユーザ情報などの重要な情報を渡すために使う
  end
end
