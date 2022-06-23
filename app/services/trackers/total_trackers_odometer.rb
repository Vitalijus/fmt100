# trackers = Trackers::TotalTrackersOdometer.new(["76d7d529-02f6-47ae-877f-98f234cd990a, 357544374597827", "547a9ca8-03c3-40dc-9ba1-9939e10314da, 357544379627306"])

class Trackers::TotalTrackersOdometer < Trackers::Base
  attr_accessor :errors, :result

  def initialize(input)
    @input = input
  end

  def call
    response = HTTP.post(base_address, params: { query: query(@input) })
    response.parse
  rescue HTTP::Error => e
    Rails.logger.error("TotalTrackersOdometer: #{e.message}")
    Rollbar.error("TotalTrackersOdometer: #{e.message}")
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
    return if response["data"]["totalTrackersOdometer"].nil?

    response["data"]["totalTrackersOdometer"].each do |tracker|
      vehicle = Vehicle.find(tracker["vehicleId"])
      vehicle.update(total_km: tracker["totalTrackerOdometer"])
    end
  end

  def query(input)
    <<~GQL
    query totalTrackersOdometer {
      totalTrackersOdometer(
        input: #{input}
      ){
        vehicleId
        imei
        totalTrackerOdometer
      }
    }
    GQL
  end
end
