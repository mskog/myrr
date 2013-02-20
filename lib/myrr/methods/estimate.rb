module Myrr
  module Methods
    class Estimate
      def initialize(client,preference)
        @client = client
        @preference = preference
      end

      def perform
        @client.connection.get("/estimate/#{@preference.user_id}/#{@preference.item_id}")
      end
    end
  end
end