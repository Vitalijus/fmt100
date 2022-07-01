module VehicleWorkers
  class UpdateCityWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # Updating city field every min.
    def perform
      vehicles = Vehicle.all

      vehicles.each do |vehicle|
        if vehicle[:cities].present?
          city = vehicle[:cities].first["city"] || vehicle["cities"].first["town"]
          vehicle.update(city: city)
        end
      end
    end
  end
end
