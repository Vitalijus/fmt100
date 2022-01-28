json.extract! vehicle, :id, :manufacturer, :model, :plate_number, :category, :body_style, :color, :year, :ad_size, :ad_duration, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
