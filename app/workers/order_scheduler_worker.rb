require "sidekiq-scheduler"

class VehicleSchedulerWorker
  include Sidekiq::Worker

  def perform
    OrderWorkers::UpdateOrderStatusWorker.perform_async
  end
end
