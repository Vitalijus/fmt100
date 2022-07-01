require "sidekiq-scheduler"

class VehicleCitySchedulerWorker
  include Sidekiq::Worker

  def perform
    VehicleWorkers::UpdateCityWorker.perform_async
  end
end
