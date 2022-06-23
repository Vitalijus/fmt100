module VehicleWorkers
  class UpdateCitiesEldershipsWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # Updating cities, elderships every few min.
    def perform
      vehicles = Vehicle.all.map{|vehicle| vehicle[:id]}
      stats = Trackers::StatsByVehicleId.new(vehicles)
      stats.build_response

      Rollbar.error(stats.errors) if stats.errors.present?
    end
  end
end
