json.extract! tracker, :id, :latitude, :longitude, :altitude, :angle, :satellites, :speed, :created_at, :updated_at
json.url tracker_url(tracker, format: :json)
