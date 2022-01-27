require "sidekiq-scheduler"

class OdometerSchedulerWorker
  include Sidekiq::Worker

  def perform
    OdometerWorkers::GetDistanceWorker.perform_async
  end
end
