# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Rails console
# tracker = Tracker.order(created_at: :desc).last(500).each{|tracker| p "latitude: #{tracker.latitude}, longitude: #{tracker.longitude}, vehicle_id: #{tracker.vehicle_id}, speed: #{tracker.speed}, created_at #{tracker.created_at}"}
# odometer = Odometer.order(created_at: :desc).first(200).each{|odometer| p "distance: #{odometer.distance}, duration: #{odometer.duration}, destination_address: #{odometer.destination_address}, origin_address: #{odometer.origin_address}, created_at #{odometer.created_at}"}

@coordinates = [
  { latitude: 53.91352101552962, longitude: 27.247520368856208, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.91785200006078, longitude: 27.326626730813807, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335283, longitude: 27.5356033, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.932145, longitude: 27.5609866, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338933, longitude: 27.5344683, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336816, longitude: 27.5350283, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9323933, longitude: 27.530855, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339383, longitude: 27.53491, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933835, longitude: 27.5344433, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339116, longitude: 27.5343283, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338966, longitude: 27.5362966, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9323783, longitude: 27.5306566, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9322616, longitude: 27.5492633, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933545, longitude: 27.5353133, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336183, longitude: 27.53492, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335933, longitude: 27.5349966, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338033, longitude: 27.5344216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93359, longitude: 27.5352166, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338966, longitude: 27.5344383, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335766, longitude: 27.5352683, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336916, longitude: 27.5352166, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339433, longitude: 27.5349183, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338233, longitude: 27.5343916, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9309483, longitude: 27.5400783, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335816, longitude: 27.5350233, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338833, longitude: 27.53471, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.934435, longitude: 27.534355, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338366, longitude: 27.5347816, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337183, longitude: 27.5353383, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335283, longitude: 27.5355249, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338033, longitude: 27.5346683, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338133, longitude: 27.5349333, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336933, longitude: 27.5349333, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336416, longitude: 27.5347366, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9340166, longitude: 27.5340616, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338333, longitude: 27.53494, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337, longitude: 27.5347533, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339016, longitude: 27.5342716, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336266, longitude: 27.5352433, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337616, longitude: 27.5349366, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337966, longitude: 27.53483, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337233, longitude: 27.5349033, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9310066, longitude: 27.540435, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336383, longitude: 27.5353549, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339333, longitude: 27.5349216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9357933, longitude: 27.5257533, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339966, longitude: 27.5343999, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93395, longitude: 27.5341716, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93372, longitude: 27.5359816, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93601, longitude: 27.5247733, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93344, longitude: 27.5352133, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337916, longitude: 27.53609, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336183, longitude: 27.5348216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9340133, longitude: 27.534035, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336899, longitude: 27.5357499, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338166, longitude: 27.53495, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933785, longitude: 27.5346183, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93368, longitude: 27.53449, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336783, longitude: 27.534905, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9334983, longitude: 27.53582, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339983, longitude: 27.5365233, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93383, longitude: 27.534265, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335566, longitude: 27.5350516, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.93361, longitude: 27.53477, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9334383, longitude: 27.5354483, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338733, longitude: 27.5345916, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338233, longitude: 27.5346216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336166, longitude: 27.5347766, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339416, longitude: 27.5358766, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335066, longitude: 27.5351583, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337166, longitude: 27.535065, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339466, longitude: 27.5347716, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933865, longitude: 27.5340816, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335916, longitude: 27.5354333, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336783, longitude: 27.5345216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338833, longitude: 27.5341516, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9357566, longitude: 27.5262566, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339983, longitude: 27.5365233, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337633, longitude: 27.5346666, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9336383, longitude: 27.5353549, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338416, longitude: 27.5346566, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933725, longitude: 27.5350416, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338333, longitude: 27.53494, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933885, longitude: 27.5346866, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337866, longitude: 27.53484, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337516, longitude: 27.5344283, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9337516, longitude: 27.5344283, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933525, longitude: 27.5355799, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335533, longitude: 27.5343333, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339516, longitude: 27.5347216, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.933835, longitude: 27.5343533, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338333, longitude: 27.53451, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9338233, longitude: 27.5353916, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335666, longitude: 27.534835, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335566, longitude: 27.5352333, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335966, longitude: 27.5349783, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9340016, longitude: 27.5341749, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335033, longitude: 27.5354683, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339883, longitude: 27.534735, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9332033, longitude: 27.5304283, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9339299, longitude: 27.53458, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
  { latitude: 53.9335966, longitude: 27.5342, vehicle_id: "72de8437-4766-4b33-bb32-d699b4536c7b" },
]

@coordinates.each do |coordinate|
  Tracker.create(latitude: coordinate[:latitude], longitude: coordinate[:longitude], vehicle_id: coordinate[:vehicle_id])
end
