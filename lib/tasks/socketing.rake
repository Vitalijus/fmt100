# rake socketing:start

namespace :socketing do
  desc "Start TCP server"
  task start: :environment do
    require 'socket'
    require 'binascii'

    puts "Started TCP Server"

    host = Rails.env.production? ? "34.215.230.158" : "127.0.0.1"
    port = 65432
    server = TCPServer.new("0.0.0.0", port)

    loop do
      Thread.start(server.accept) do |client|
        p "Inside Task"
        p "#{client.gets}"
        p "#{client.recv(1000)}"
        p "#{Binascii.b2a_hex(client.gets)}"
        p "#{Binascii.b2a_hex(client.gets).length > 2}"

        # client.puts "Time is #{Time.now}"
        # client.puts "#{client}"

        p "Connection closed"
        client.close

        # string = client.recv(1000).chomp # Request Data received at the socket port
        # result = JSON.parse(string)
        # client.puts result.to_s
      end
    end
  end
end
