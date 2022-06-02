class Trackers::TrackersByMinutesAgo < Trackers::Base
  attr_accessor :errors, :result

  def initialize(minutes_ago)
    @minutes_ago = minutes_ago
  end

  def call
    response = HTTP.post(base_address, params: { query: query(@minutes_ago) })
    response.parse
  rescue HTTP::Error => e
    Rails.logger.error("TrackersByMinutesAgo: #{e.message}")
    Rollbar.error("TrackersByMinutesAgo: #{e.message}")
    {}
  end

  def build_response
    if call.empty?
      @errors = "Connection failure"
    elsif call["errors"].present?
      @errors = "#{call["errors"]}"
    else
      @result = process_response(call)
    end
  end

  private

  def process_response(response)
    return if response["data"]["trackersByMinutesAgo"].nil?

    response["data"]["trackersByMinutesAgo"]
  end

  def query(minutes_ago)
    <<~GQL
    query trackersByMinutesAgo{
      trackersByMinutesAgo(minutesAgo: #{minutes_ago}){
        id
        vehicleId
        latitude
        longitude
        speed
        withinRadius
        city
        radiusSize
        radiusLatitude
        radiusLongitude
        createdAt
        updatedAt
      }
    }
    GQL
  end
end
