module Mutations
  module Odometers
    class CreateUpdateOdometer < Mutations::BaseMutation
      graphql_name "CreateUpdateOdometer"
      description "Create or update Odometer"

      argument :vehicle_id, ID, required: true
      argument :destination_address, String, required: false
      argument :origin_address, String, required: false
      argument :distance, Int, required: false
      argument :duration, Int, required: false
      argument :city, String, required: false
      argument :within_radius, Boolean, required: false
      argument :distance_price, Float, required: false

      type Types::OdometerType

      def resolve(args)
        Odometer.create!(args)
      end
    end
  end
end
