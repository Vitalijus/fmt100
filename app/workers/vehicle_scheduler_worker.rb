require "sidekiq-scheduler"

class VehicleSchedulerWorker
  include Sidekiq::Worker

  def perform
    VehicleWorkers::UpdateVehicleWorker.perform_async
  end
end
