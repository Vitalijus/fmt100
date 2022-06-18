module VehicleWorkers
  class UpdateVehicleWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # Updating cities, total_km, elderships every few min.
    def perform
      vehicles = Vehicle.all.map{|vehicle| vehicle[:id]}
      stats = Trackers::StatsByVehicleId.new(vehicles)
      stats.build_response

      Rollbar.error("UpdateVehicleWorker: #{stats.errors}") if stats.errors.present?
    end
  end
end
