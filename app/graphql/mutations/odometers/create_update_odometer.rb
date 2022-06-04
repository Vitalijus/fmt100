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
        if distance_conditional(args[:distance], args[:duration])
          args[:distance_price] = distance_price(args[:vehicle_id], args[:distance]) if args[:distance_price].nil?
          Odometer.create!(args)
        end
      end

      def distance_price(vehicle_id, distance)
        vehicle = Vehicle.find(vehicle_id)
        (distance.to_d / 1000.to_d) * vehicle.km_price
      end

      # Check that distance value is above 0 and below 1200 meters.
      # Check is added to improve vehicle odometer precision.
      def distance_conditional(distance, duration)
        distance.between?(1, 1200) &&
         duration > 0
      end
    end
  end
end
