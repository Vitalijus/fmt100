# rake socketing:start
# rails server -b 0.0.0.0
# http://34.215.230.158:3000/
# internet.life.com.by

# Send message to the server locally
# echo '"\u0000\u000F357544374597827"' | nc 127.0.0.1 65432

namespace :socketing do
  desc "Start TCP server"
  task start: :environment do
    require 'socket'
    require 'date'

    class ClientThread
      def initialize(port)
        @server = TCPServer.open(port)
        @imei = "unknown"
      end

      def log(msg)
        "#{Time.now.utc.strftime('%FT%T')} #{msg}"
      end

      def run
        p self.log("Started TCP Server")

        loop do
          Thread.start(@server.accept) do |client|
            if client
              2.times do |index|
                begin
                  buff = client.recv(8192)
                  length, imei = buff.unpack("Sa*")
                  data = buff.unpack("H*").first

                  if index == 0
                    @imei = imei
                    p self.log("Device Authenticated | IMEI: #{@imei}")
                    client.send([0x01].pack("C"), 0)
                  elsif index == 1
                    decoder = Decoder.new(data, @imei)
                    num_of_rec = decoder.number_of_rec

                    if num_of_rec == 0
                      client.send([0x00].pack("C"), 0)
                      client.close
                    else
                      p decoder.decode
                      client.send([num_of_rec].pack("L>"), 0)
                      p self.log("Done! Closing Connection")
                      client.close

                      create_tracker(decoder.decode)
                    end
                  else
                    client.send([0x00].pack("C"), 0)
                  end

                rescue SocketError
                  p self.log("Socket has failed")
                end
              end # end of loop twice

            else
              p self.log('Socket is null')
            end # if conditional
          end # end of Thread
        end # end of infinite loop
      end # run method

      def create_tracker(gps_data)
        gps_data.each do |gps|
          unless (gps[:gps_data][:longitude] && gps[:gps_data][:latitude]) == 0.0
            vehicle = Vehicle.find_by(tracker_imei: gps[:imei])
            vehicle.trackers.create(build_tracker(gps)) if vehicle.present?
          end
        end
      end

      def build_tracker(gps)
        {
          longitude: gps[:gps_data][:longitude],
          latitude: gps[:gps_data][:latitude],
          speed: gps[:gps_data][:speed]
        }
      end
    end # end of class

    new_thread = ClientThread.new(65432)
    p new_thread.run
  end
end
