module Myrr
  module Methods
    class Refresh
      def initialize(client)
        @client = client
      end

      def perform
        @client.connection.post("/refresh")
      end
    end
  end
end