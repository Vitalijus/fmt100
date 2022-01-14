require "uri"
require "json"
require "net/http"

module GoogleMaps
  class Base
    def call(origins, destinations)
      begin
        url = URI("https://maps.googleapis.com/maps/api/distancematrix/json")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Get.new(address(origins, destinations))
        response = https.request(request)
        result = JSON.parse(response.body)
      rescue
        {}
      end
    end

    def address(origins, destinations)
      coordinates = []

      destinations.each do |dest|
        coordinates << "#{dest[:latitude]},#{dest[:longitude]}"
      end

      URI("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{origins[:latitude]}%2C#{origins[:longitude]}&destinations=#{coordinates[1..-1].join("%7C")}&key=AIzaSyC1xYJS1QPq9UQAtFwoMJRNFhDzKKTFPjQ")
    end
  end
end
