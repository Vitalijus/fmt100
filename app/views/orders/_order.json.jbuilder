json.extract! order, :id, :vehicle_id, :phone_number, :company_title, :name, :surname, :email_address, :created_at, :updated_at
json.url order_url(order, format: :json)
