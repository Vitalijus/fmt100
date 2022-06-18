# stats = Trackers::StatsByVehicleId.new(["76d7d529-02f6-47ae-877f-98f234cd990a", "4e9ed47d-81ef-4298-850b-c3379b105174", "3d150339-d85c-46a9-b7a3-1f1dd718d6c4"])

class Trackers::StatsByVehicleId < Trackers::Base
  attr_accessor :errors, :result

  def initialize(vehicle_id)
    @vehicle_id = vehicle_id
  end

  def call
    response = HTTP.post(base_address, params: { query: query(@vehicle_id) })
    response.parse
  rescue HTTP::Error => e
    Rails.logger.error("StatsByVehicleId: #{e.message}")
    Rollbar.error("StatsByVehicleId: #{e.message}")
    {}
  end

  def build_response
    response = call || {}

    @errors = "Data not available" if response.blank?
    @errors = "#{response["errors"]}" if response["errors"].present?
    @result = process_response(response)
  end

  private

  def process_response(response)
    return if response["data"]["statsByVehiclesId"].nil?

    response["data"]["statsByVehiclesId"].each do |stat|
      vehicle = Vehicle.find(stat["vehicleId"])
      cities = stat["cities"].sort_by { |city| city["percentage"] }.reverse
      elderships = stat["elderships"].sort_by { |eldership| eldership["percentage"] }.reverse

      vehicle.update(build_vehicle(stat, cities, elderships))
    end
  end

  def build_vehicle(stat, cities, elderships)
    {
      total_km: stat["totalVehicleOdometer"],
      cities: cities,
      elderships: elderships
    }
  end

  def query(vehicle_id)
    <<~GQL
    query statsByVehiclesId {
      statsByVehiclesId(
        vehicleId: #{vehicle_id}
      ){
        vehicleId
        totalVehicleOdometer
        cities
        elderships
        countRecords
      }
    }
    GQL
  end
end
