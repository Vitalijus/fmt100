module VehiclesHelper
  def vehicle_distance_helper(vehicle_id)
    @distance = []
    @odometers = Odometer.where(vehicle_id: vehicle_id)

    @odometers.each do |odometer|
      @distance << odometer.distance
    end

    "#{(@distance.sum / 1000.0).round(2)}km"
  end
end
