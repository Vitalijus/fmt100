module VehicleWorkers
  class UpdateTotalKmWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # Updating total_km.
    def perform
      trackers_odometer = Trackers::TotalTrackersOdometer.new(vehicles.compact)
      trackers_odometer.build_response

      Rollbar.error(trackers_odometer.errors) if trackers_odometer.errors.present?
    end

    def vehicles
      vehicles = Vehicle.all
      vehicles.map do |vehicle|
        if vehicle[:tracker_imei].present?
          "#{vehicle[:id]}, #{vehicle[:tracker_imei]}"
        end
      end
    end
  end
end
