module OdometerWorkers
  class CreateOdometerWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # OdometerWorkers::CreateOdometerWorker do not serialize to JSON safely. This will raise an error in
    # Sidekiq 7.0. See https://github.com/mperham/sidekiq/wiki/Best-Practices or raise an error today
    # by calling `Sidekiq.strict_args!` during Sidekiq initialization.
    def perform(distances, odometer_payload)
      distances = distances.with_indifferent_access
      odometer_payload = odometer_payload.with_indifferent_access

      if distances.present?
        Odometer.create(build_odometer(distances, odometer_payload, distance_price(distances, odometer_payload))) if distance_conditional(distances)
      end
    end

    def distance_price(distances, odometer_payload)
      vehicle = Vehicle.find(odometer_payload[:vehicle_id])
      calc_distance_price(distances, vehicle)
    end

    def calc_distance_price(distances, vehicle)
      meters = distances[:rows].first[:elements].first[:distance][:value]
      price = vehicle.km_price

      (meters.to_d / 1000.to_d) * price
    end

    # Check that distance value is above 0 and below 1200 meters.
    # Meters check is added to improve vehicle odometer precision.
    def distance_conditional(distances)
      distances[:rows].first[:elements].first[:distance][:value] > 0 &&
        distances[:rows].first[:elements].first[:distance][:value] < 1200 &&
        distances[:rows].first[:elements].first[:duration][:value] > 0
    end

    def build_odometer(distances, odometer_payload, distance_price)
      {
        city: odometer_payload[:city],
        within_radius: odometer_payload[:within_radius],
        vehicle_id: odometer_payload[:vehicle_id],
        destination_address: distances[:destination_addresses].first,
        origin_address: distances[:origin_addresses].first,
        distance: distances[:rows].first[:elements].first[:distance][:value],
        duration: distances[:rows].first[:elements].first[:duration][:value],
        distance_price: distance_price
      }
    end
  end
end
