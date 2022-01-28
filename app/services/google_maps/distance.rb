module GoogleMaps
  class Distance < Base
    def distance
      tracker = Tracker.where("created_at > ?", 500.minute.ago)

      if tracker.present?
        coordinates_list(tracker).each do |coordinate_list|
          url_payload = url_payload(coordinate_list)
          vehicle_id = url_payload[:vehicle_id]
          distances = call(url_payload[:origins], url_payload[:destinations])

          binding.pry
          if distances.present? && distances["rows"][0]["elements"][0]["status"] == "OK" && distances["status"] == "OK"
            OdometerWorkers::CreateOdometerWorker.perform_async(distances, vehicle_id)
          else
            # Rollbar notification
          end
        end
      end
    end

    def coordinates_list(tracker)
      tracker.each_slice(2).to_a.map do |coordinates|
        coordinates.map do |coordinate|
          { latitude: coordinate[:latitude], longitude: coordinate[:longitude], vehicle_id: coordinate[:vehicle_id] }
        end
      end
    end

    def url_payload(coordinate_list)
      origins = coordinate_list.first.except(:vehicle_id)
      destinations = coordinate_list.last.except(:vehicle_id)
      vehicle_id = coordinate_list.last[:vehicle_id]

      {
        origins: origins,
        destinations: destinations,
        vehicle_id: vehicle_id
      }
    end
  end
end
