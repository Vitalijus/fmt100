module OdometerWorkers
  class GetDistanceWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform
      # IMPORTANT!!!
      # argument 2 should match with OdometerSchedulerWorker cron: '0 */2 * * * *' in sidekiq.yml
      # Sidekiq scheduler is triggered every 2min, therefore Tracker would return last 2min records.
      # If time_ago and scheduler minutes not matching, we end up with data dups or lose.
      distance_matrix = GoogleMaps::Distance.new(2)
      distance_matrix.distance
    end
  end
end
