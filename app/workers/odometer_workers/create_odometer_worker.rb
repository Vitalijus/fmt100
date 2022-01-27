module OdometerWorkers
  class CreateOdometerWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(distances)
      Odometer.create(build_odometer(distances)) if distances.present?
    end

    def build_odometer(distances)
      {
        destination_address: distances["destination_addresses"].first,
        origin_address: distances["origin_addresses"].first,
        distance: distances["rows"].first["elements"].first["distance"]["value"],
        duration: distances["rows"].first["elements"].first["duration"]["value"]
      }
    end
  end
end
