module VehiclesHelper

  # Order status

  def order_status_helper(vehicle)
    status = vehicle.orders.where(status: "active")
    date = status.first.ad_end.nil? ? "šiandien" : status.first.ad_end if status.first.present?

    status.count == 1 ? "Laisvas nuo #{date}" : "Laisvas"
  end
end
