module VehiclesHelper
  def options_for_select_helper
    city_list.map do |city|
      "#{city[:city]}"
    end
  end

  def city_list
    cities = Vehicle.distinct.pluck(:city)

    cities_array = []
    cities.map do |city|
      cities_array << { city: city, count: Vehicle.where(city: city).count } if city.present?
    end

    cities_array = cities_array.sort! { |hsh| hsh[:count] }
    cities_array
  end

  def km_converter_helper(distance)
    (distance.to_f / 1000).round(2)
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

  # Pricing

  # def price_helper(vehicle)
  #   # binding.pry
  #   vehicle = Vehicle.find_by!(id: vehicle)
  #
  #   # percentage_calc = 100 * percentage(vehicle.percentage)
  #   # category_calc = 100 * category(vehicle.category)
  #
  #   # binding.pry
  #   # (percentage_calc.to_f + category_calc.to_f) / 200.0
  #   vehicle.percentage
  # end
  #
  #
  # # Represents percentage field in Vehicle
  # def percentage(percentage)
  #   return 0.5 if percentage.nil?
  #
  #   pricing = build_percentage_pricing.map do |pricing|
  #     pricing[:km_price] if pricing[:percentage] > percentage
  #   end
  #
  #   pricing.compact.first
  # end
  #
  # # Represents category field in Vehicle
  # def category(category)
  #   return 0.3 if category.nil?
  #
  #   pricing = build_category_pricing.map do |pricing|
  #     pricing[:km_price] if pricing[:category] == category
  #   end
  #
  #   # binding.pry
  #   pricing.compact.first.nil? ? 0.3 : pricing.compact.first
  # end
  #
  # def build_percentage_pricing
  #   [
  #     { percentage: 50, km_price: 0.5 },
  #     { percentage: 75, km_price: 0.75 },
  #     { percentage: 100, km_price: 1 }
  #   ]
  # end
  #
  # def build_category_pricing
  #   [
  #     { category: "car", km_price: 0.3 },
  #     { category: "bus", km_price: 0.9 },
  #     { category: "lorry", km_price: 1 }
  #   ]
  # end
end
