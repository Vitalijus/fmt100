module Types
  class VehicleType < Types::BaseObject
    graphql_name "VehicleType"

    field :id, ID, null: false
    field :tracker_imei, String, null: false
  end
end
