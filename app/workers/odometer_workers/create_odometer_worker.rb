module OdometerWorkers
  class CreateOdometerWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(distances, odometer_payload)
      Odometer.create(build_odometer(distances, odometer_payload)) if distances.present?
    end

    def build_odometer(distances, odometer_payload)
      distances = distances.with_indifferent_access
      odometer_payload = odometer_payload.with_indifferent_access

      {
        city: odometer_payload[:city],
        within_radius: odometer_payload[:within_radius],
        vehicle_id: odometer_payload[:vehicle_id],
        destination_address: distances[:destination_addresses].first,
        origin_address: distances[:origin_addresses].first,
        distance: distances[:rows].first[:elements].first[:distance][:value],
        duration: distances[:rows].first[:elements].first[:duration][:value]
      }
    end
  end
end
