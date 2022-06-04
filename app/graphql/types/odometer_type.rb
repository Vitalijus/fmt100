module Types
  class OdometerType < Types::BaseObject
    graphql_name "OdometerType"

    field :id, ID, null: false
  end
end
