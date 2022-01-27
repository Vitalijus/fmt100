module GoogleMaps
  class Distance < Base
    def distance
      tracker = Tracker.where("created_at > ?", 5.minute.ago)

      if tracker.present?
        coordinates_list(tracker).each do |coordinate_list|
          url_payload = url_payload(coordinate_list)
          distances = call(url_payload[:origins], url_payload[:destinations])

          if distances.present? && distances["rows"][0]["elements"][0]["status"] == "OK" && distances["status"] == "OK"
            OdometerWorkers::CreateOdometerWorker.perform_async(distances)
          else
            # Rollbar notification
          end
        end
      end
    end

    def coordinates_list(tracker)
      tracker.each_slice(2).to_a.map do |coordinates|
        coordinates.map do |coordinate|
          { latitude: coordinate[:latitude], longitude: coordinate[:longitude] }
        end
      end
    end

    def url_payload(coordinate_list)
      origins_lat = coordinate_list.first[:latitude]
      origins_lon = coordinate_list.first[:longitude]
      destinations = coordinate_list.last

      {
        origins: { latitude: origins_lat, longitude: origins_lon },
        destinations: destinations
      }
    end
  end
end
