module OdometersHelper

  # Proportion of time vehicle spend in the city
  def vehicle_location_helper(vehicle_id)
    cities = Odometer.distinct.pluck(:city)

    results = []
    cities.each do |city|
      odometers = Odometer.where(vehicle_id: vehicle_id, city: city)

      results << { city: city, duration: vehicle_location_duration(odometers) }
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
    "#{percentage.first[:percentage].round(2)}% driving spent in #{percentage.first[:city]}" if percentage.present? && percentage.first[:city].present?
  end

  def vehicle_location_total_duration(results)
    total_duration = []

    results.each do |result|
      total_duration << result[:duration]
    end

    total_duration.sum
  end

  def vehicle_location_duration(odometers)
    duration = []

    odometers.each do |odometer|
      duration << odometer.duration
    end

    duration.sum
  end

  # Total vehicle distance
  def vehicle_distance_helper(vehicle_id)
    distance = []
    odometers = Odometer.where(vehicle_id: vehicle_id)

    odometers.each do |odometer|
      distance << odometer.distance
    end

    "#{(distance.sum / 1000.0).round(2)}km"
  end
end
