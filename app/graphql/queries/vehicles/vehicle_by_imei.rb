module Queries
  module Vehicles
    class VehicleByImei < Queries::BaseQuery
      graphql_name "VehicleByImei"
      description "Find vehicle by IMEI"

      argument :tracker_imei, String, required: true
      type Types::VehicleType, null: true

      def resolve(args)
        Vehicle.find_by(tracker_imei: args[:tracker_imei])
      end
    end
  end
end
