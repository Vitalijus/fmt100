module VehiclesHelper
  def options_for_select_helper
    city_list.map do |city|
      "#{city[:city]}"
    end
  end

  def city_list
    # binding.pry
    cities = Vehicle.distinct.pluck(:city)
    # cities = Vehicle.distinct.pluck(:cities)

    cities_array = []
    cities.map do |city|
      cities_array << { city: city, count: Vehicle.where(city: city).count } if city.present?
    end

    cities_array = cities_array.sort! { |hsh| hsh[:count] }
    cities_array
  end

  def km_converter_helper(distance)
    (distance.to_f / 1000).round(1)
  end

  # Order status

  def order_status_helper(vehicle)
    status = vehicle.orders.where(status: "active")
    date = status.first.ad_end.nil? ? "šiandien" : status.first.ad_end if status.first.present?

    status.count == 1 ? "Laisvas nuo #{date}" : "Laisvas"
  end

  # Dictance price

  def distance_price_helper(vehicle)
    odometers = Odometer.where(vehicle_id: vehicle.id)
    total_price = odometers.map{|odometer| odometer.distance_price.to_f }
    total_price.sum.round(2)
  end
end
