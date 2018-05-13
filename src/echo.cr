require "http/server"
require "./echo/*"

module Echo

  echo_port = ENV["ECHO_PORT"]?.try(&.to_i) || 8018
  echo_host = ENV["ECHO_HOST"]?.try(&.to_s) || "0.0.0.0"

  server = HTTP::Server.new(echo_host, echo_port, [
    HTTP::LogHandler.new,
  ]) do |ctx|
    response = <<-TEMPLATE
    #{ctx.request.method} #{ctx.request.path} #{ctx.request.version}
    Request address: #{ctx.request.host}

    TEMPLATE

    ctx.response.status_code = 200
    ctx.response.content_type = "text/plain"
    ctx.response.print response
  end

  puts "Listening on #{echo_host}:#{echo_port}"
  server.listen

end
