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
end
