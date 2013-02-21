module Myrr
  module Methods
    class Ready
      def initialize(client)
        @client = client
      end

      def perform
        @client.connection.head('/ready').status == 200
      end
    end
  end
end