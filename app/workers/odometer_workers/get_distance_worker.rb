module OdometerWorkers
  class GetDistanceWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform
      GoogleMaps::Distance.new.distance
    end
  end
end
