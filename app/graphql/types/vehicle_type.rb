module Types
  class VehicleType < Types::BaseObject
    graphql_name "VehicleType"

    field :tracker_imei, String, null: false
  end
end
