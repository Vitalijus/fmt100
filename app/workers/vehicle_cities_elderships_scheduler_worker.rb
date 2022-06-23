require "sidekiq-scheduler"

class VehicleCitiesEldershipsSchedulerWorker
  include Sidekiq::Worker

  def perform
    VehicleWorkers::UpdateCitiesEldershipsWorker.perform_async
  end
end
