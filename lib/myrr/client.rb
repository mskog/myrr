require 'csv'
require 'json'

module Myrr
  class Client
    attr_reader :uri

    attr_reader :port

    def initialize(uri, port)
      @uri = uri
      @port = port
    end

    def connection
      @connection ||= Faraday.new(base_uri) do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def json_connection
      @json_connection ||= Faraday.new(base_uri) do |conn|
        conn.request :json
        conn.response :json
        conn.adapter Faraday.default_adapter
      end
    end

    private

    def base_uri
      "#{@uri}:#{@port}"
    end
  end
end