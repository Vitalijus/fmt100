require "sidekiq-scheduler"

class VehicleTotalKmSchedulerWorker
  include Sidekiq::Worker

  def perform
    VehicleWorkers::UpdateTotalKmWorker.perform_async
  end
end
