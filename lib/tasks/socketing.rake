# rake socketing:start

# Send message to the server locally
# echo '"\u0000\u000F357544374597827"' | nc 127.0.0.1 65432

namespace :socketing do
  desc "Start TCP server"
  task start: :environment do
    require 'socket'
    require 'binascii'

    puts "Started TCP Server"

    host = Rails.env.production? ? "34.215.230.158" : "127.0.0.1"
    port = 65432
    server = TCPServer.new("0.0.0.0", port) # 0.0.0.0  ???????????????

    # sock = server.accept
    # p sock.remote_address #=> #<Addrinfo: 127.0.0.1:36504 TCP>

    # server = TCPServer.open("127.0.0.1", port) {|serv|
    #   socket = TCPSocket.new("127.0.0.1", port)
    #   s = serv.accept
    #   p s.remote_address #=> #<Addrinfo: 127.0.0.1:36504 TCP>
    # }

    # af, portt, host, addr = server.addr
    # socket = TCPSocket.new(addr, portt)

    loop do
      Thread.start(server.accept) do |client|
        p "Imei"
        puts client.gets
        puts "Accepting connection from: #{client.peeraddr[2]}"
        # puts JSON.parse(client.gets)

        # p "Remote address"
        # puts server.accept.remote_address

        # imei = client.gets
        # puts Binascii.a2b_hex(imei)
        # puts imei

        # p "Server addr"
        # af, port, host, addr = server.addr
        # puts addr

        # p "Send socket"
        # TCPSocket.open("localhost", 80) {|s|
        #   s.send "GET / HTTP/1.0\r\n\r\n", 0
        #   p s.read
        # }
        # puts socket.send('aaa', port)

        # TCPSocket.open("www.ruby-lang.org", 80) {|s|
        #   p s.remote_address #=> #<Addrinfo: 221.186.184.68:80 TCP>
        # }

        # TCPSocket.open("localhost", 80) {|s|
        #   s.send "GET / HTTP/1.0\r\n\r\n", 0
        #   p s.read
        # }
        # puts Binascii.b2a_hex(imei)


        # while line = client.gets
        #   puts line
        # end
        # client.puts client.gets.to_s
        # imei = client.recv(1000).chomp
        # p "#{client.recv(1000).chomp}"
        # p "#{Binascii.b2a_hex(imei)}"
        # p "#{Binascii.b2a_hex(client.gets).length > 2}"

        # client.send("\x01".encode("utf-8"))

        # client.puts "Time is #{Time.now}"
        # client.puts "#{client}"
        # 357544374597827
        # 000000000000003608010000016B40D8EA30010000000000000000000000000000000105021503010101425E0F01F10000601A014E0000000000000000010000C7CF

        p "Connection closed"
        client.close

        # string = client.recv(1000).chomp # Request Data received at the socket port
        # result = JSON.parse(string)
        # client.puts result.to_s
      end
    end
  end
end
