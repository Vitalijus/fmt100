module VehicleWorkers
  class UpdateVehicleWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform
      update_vehicle
    end

    private

    def update_vehicle
      vehicles = Vehicle.all

      vehicles&.each do |vehicle|
        vehicle.update(build_update(city(vehicle), total_km(vehicle), last_four_weeks(vehicle)))
      end
    end

    def build_update(city, total_km, last_four_weeks_km)
      {
        city: city,
        total_km: total_km,
        last_four_weeks_km: last_four_weeks_km
      }
    end

    def city(vehicle)
      vehicle_payload = []
      return unless cities(vehicle).present?

      cities(vehicle)&.map do |city|
        odometers = vehicle_odometers(vehicle, city)&.map do |odometer|
          { city: odometer.city, duration: odometer.duration }
        end

        vehicle_payload << { city: city,
                             duration: odometers.inject(0){|sum,duration| sum + duration[:duration]} }
      end

      city = vehicle_payload.sort! { |hsh| hsh[:duration] }
      city.first[:city]
    end

    def total_km(vehicle)
      odometers = Odometer.where(vehicle_id: vehicle)

      odometers&.map do |odometer|
        { total_km: odometer.distance }
      end.inject(0){|sum,total_km| sum + total_km[:total_km]}
    end

    def last_four_weeks(vehicle)
      odometers = Odometer.where("created_at > ?", 28.days.ago).where(vehicle_id: vehicle)

      odometers&.map do |odometer|
        { last_four_weeks: odometer.distance }
      end.inject(0){|sum,last_four_weeks| sum + last_four_weeks[:last_four_weeks]}
    end

    def vehicle_odometers(vehicle, city)
      Odometer.where(vehicle_id: vehicle, city: city)
    end

    def cities(vehicle)
      Odometer.where(vehicle_id: vehicle).distinct.pluck(:city)
    end
  end
end
