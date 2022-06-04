module Mutations
  module Odometers
    class CreateUpdateOdometer < Mutations::BaseMutation
      graphql_name "CreateUpdateOdometer"
      description "Create or update Odometer"

      argument :vehicle_id, ID, required: true
      argument :destination_address, String, required: false
      argument :origin_address, String, required: false
      argument :distance, Int, required: true
      argument :duration, Int, required: false
      argument :city, String, required: false
      argument :within_radius, Boolean, required: false
      argument :distance_price, Float, required: false

      type Types::OdometerType

      def resolve(args)
        args[:distance_price] = distance_price(args[:vehicle_id], args[:distance]) if args[:distance_price].nil?
        Odometer.create!(args)
      end

      def distance_price(vehicle_id, distance)
        vehicle = Vehicle.find(vehicle_id)

        (distance.to_d / 1000.to_d) * vehicle.km_price
      end
    end
  end
end
