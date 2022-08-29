module OrderWorkers
  class UpdateOrderStatusWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    # Update Order status once a day at midnight.
    # Should activate order, when ad is set to active.
    # Should deactivate order, when ad end.
    def perform
      iterate_orders
    end

    private

    def iterate_orders
      orders = Order.all

      orders.each do |order|
        if order.status == "active" && order.ad_start.nil? && order.ad_end.nil?
          order.update(ad_start: Date.today, ad_end: Date.today + order.ad_duration.to_i)
        elsif order.status == "active" && Date.today > order.ad_end
          # TO DO When Order gets deactivated, then vehicle should be set published: true
          order.update(status: "deactivated")
        end
      end
    end
  end
end
