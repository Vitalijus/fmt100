# rake socketing:start

namespace :socketing do
  desc "Start TCP server"
  task start: :environment do
    require 'socket'
    puts "Started TCP Server"

    host = Rails.env.production? ? "34.215.230.158" : "127.0.0.1"
    port = 65432
    server = TCPServer.new("0.0.0.0", port)

    loop do
      Thread.start(server.accept) do |client|
        p "Inside Task"
        p "#{client}"
        p "#{client.puts}"
        p "#{client.gets}"
        p "#{client.inspect}"

        # client.puts "Time is #{Time.now}"
        # client.puts "#{client}"

        p 'Bye'
        client.close

        # string = client.recv(1000).chomp # Request Data received at the socket port
        # result = JSON.parse(string)
        # client.puts result.to_s
      end
    end
  end
end
