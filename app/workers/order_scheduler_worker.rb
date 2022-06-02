require "sidekiq-scheduler"

class OrderSchedulerWorker
  include Sidekiq::Worker

  def perform
    OrderWorkers::UpdateOrderStatusWorker.perform_async
  end
end
