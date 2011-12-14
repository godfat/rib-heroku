
require 'heroku/client/rendezvous'

class Heroku::Client::Rendezvous
  def start
    uri = URI.parse(rendezvous_url)
    host, port, secret = uri.host, uri.port, uri.path[1..-1]

    ssl_socket = Timeout.timeout(connect_timeout) do
      ssl_context = OpenSSL::SSL::SSLContext.new
      if ((host =~ /heroku\.com$/) && !(ENV["HEROKU_SSL_VERIFY"] == "disable"))
        ssl_context.ca_file = File.expand_path("../../../../data/cacert.pem", __FILE__)
        ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
      tcp_socket = TCPSocket.open(host, port)
      ssl_socket = OpenSSL::SSL::SSLSocket.new(tcp_socket, ssl_context)
      ssl_socket.connect
      ssl_socket.puts(secret)
      ssl_socket.readline
      ssl_socket
    end

    on_connect.call if on_connect

    readables = [input, ssl_socket].compact

    # begin patch
    Rib::Heroku.load(ssl_socket, output, activity_timeout)
    # end patch

    begin
      loop do
        if o = IO.select(readables, nil, nil, activity_timeout)
          if (input && (o.first.first == input))
            begin
              data = input.readpartial(10000)
            rescue EOFError
              readables.delete(input)
              next
            end
            ssl_socket.write(data)
            ssl_socket.flush
          elsif (o.first.first == ssl_socket)
            begin
              data = ssl_socket.readpartial(10000)
            rescue EOFError
              break
            end
            output.write(data)
          end
        else
          raise(Timeout::Error.new)
        end
      end
    rescue Interrupt
      ssl_socket.write("\003")
      ssl_socket.flush
      retry
    rescue Errno::EIO
    end
  end
end
