module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Vehicles
    field :vehicle_by_imei, resolver: Queries::Vehicles::VehicleByImei
  end
end
