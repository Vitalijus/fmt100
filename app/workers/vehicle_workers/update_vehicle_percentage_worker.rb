module VehicleWorkers
  class UpdateVehiclePercentageWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # VehicleWorkers::UpdateVehiclePercentageWorker.new.perform
    def perform
      update_vehicle_percentage
    end

    private

    def update_vehicle_percentage
      vehicles = Vehicle.all

      vehicles&.each do |vehicle|
        vehicle.update(percentage: vehicle_location_helper(vehicle))
      end
    end

    def vehicle_location_helper(vehicle_id)
      cities = Odometer.distinct.pluck(:city)

      results = cities.map do |city|
        odometers = Odometer.where(vehicle_id: vehicle_id, city: city)
        { city: city, duration: vehicle_location_duration(odometers) }
      end

      vehicle_location_percentage(results)
    end

    def vehicle_location_percentage(results)
      percentage = []

      results.each do |result|
        percentage_calc = (result[:duration] * 100.0) / vehicle_location_total_duration(results)
        percentage << { city: result[:city], percentage: percentage_calc } if percentage_calc >= 0
      end

      percentage = percentage.sort! { |hsh| hsh[:percentage] }
      percentage.first[:percentage].round(1) if percentage.present?
    end

    def vehicle_location_total_duration(results)
      total_duration = results.map do |result|
        result[:duration]
      end

      total_duration.sum
    end

    def vehicle_location_duration(odometers)
      duration = odometers.map do |odometer|
        odometer.duration
      end

      duration.sum
    end
  end
end
