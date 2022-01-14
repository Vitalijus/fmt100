module GoogleMaps
  class Distance < Base
    def distance
      call(tracker[:origins], tracker[:destinations])
      # address(tracker[:origins], tracker[:destinations])
    end

    def tracker
      tracker = Tracker.last(10)

      coordinates = []
      tracker.map do |track|
        coordinates << { latitude: track[:latitude], longitude: track[:longitude] }
      end

      distance_coordinates = {
        origins: coordinates[0],
        destinations: coordinates
      }

      # coordinates[0]
    end
  end
end
