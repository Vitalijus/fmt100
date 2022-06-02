module GoogleMaps
  class Distance < Base

    def initialize(minutes_ago)
      @minutes_ago = minutes_ago
    end

    def distance
      if trackers_list.present?
        coordinates_list(trackers_list).each do |coordinate_list|
          url_payload = url_payload(coordinate_list)
          odometer_payload = odometer_payload(coordinate_list)
          distances = call(url_payload[:origins], url_payload[:destinations])

          if distances.present? && distances["rows"][0]["elements"][0]["status"] == "OK" && distances["status"] == "OK"
            OdometerWorkers::CreateOdometerWorker.new.perform(distances, odometer_payload)
          else
            Rails.logger.error "GoogleMaps distance matrix: #{distances}"
            Rollbar.log("error", "GoogleMaps distance matrix: #{distances}")
          end
        end
      end
    end

    # Get trackers by making a call to EC2 server Trackers app
    def trackers_list
      trackers = Trackers::TrackersByMinutesAgo.new(@minutes_ago)
      trackers.build_response

      Rollbar.log("error", "#{trackers.errors} | GoogleMaps::Distance") if trackers.errors.present?
      trackers.result
    end

    # Slice Tracker coordinates and return as [ {}, {} ]
    def coordinates_list(trackers)
      trackers.each_slice(4).to_a.map do |coordinates|
        coordinates.map do |coordinate|
          {
            latitude: coordinate["latitude"],
            longitude: coordinate["longitude"],
            vehicle_id: coordinate["vehicleId"],
            city: coordinate["city"],
            within_radius: coordinate["withinRadius"]
          }
        end
      end
    end

    def odometer_payload(coordinate_list)
      origins = coordinate_list.first.except(:latitude, :longitude)

      {
        city: origins[:city],
        within_radius: origins[:within_radius],
        vehicle_id: origins[:vehicle_id]
      }
    end

    # First hash in coordinate_list is origins and last is destinations
    def url_payload(coordinate_list)
      origins = coordinate_list.first.except(:vehicle_id, :city, :within_radius)
      destinations = coordinate_list.last.except(:vehicle_id, :city, :within_radius)

      {
        origins: origins,
        destinations: destinations
      }
    end
  end
end
