module GoogleMaps
  class Distance < Base
    # TO DO
    # Check when tracker within_radius

    def initialize(time_ago)
      @time_ago = time_ago
    end

    def distance
      tracker = Tracker.where("created_at > ?", @time_ago)

      if tracker.present?
        coordinates_list(tracker).each do |coordinate_list|
          url_payload = url_payload(coordinate_list)
          odometer_payload = odometer_payload(coordinate_list)
          distances = call(url_payload[:origins], url_payload[:destinations])

          # binding.pry
          if distances.present? && distances["rows"][0]["elements"][0]["status"] == "OK" && distances["status"] == "OK"
            OdometerWorkers::CreateOdometerWorker.perform_async(distances, odometer_payload)
          else
            # Rollbar notification
          end
        end
      end
    end

    def coordinates_list(tracker)
      tracker.each_slice(2).to_a.map do |coordinates|
        coordinates.map do |coordinate|
          {
            latitude: coordinate[:latitude],
            longitude: coordinate[:longitude],
            vehicle_id: coordinate[:vehicle_id],
            city: coordinate[:city],
            within_radius: coordinate[:within_radius]
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
