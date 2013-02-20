module Myrr
  module Methods
    class RemovePreference
      def initialize(client,preference)
        @client = client
        @preference = preference
      end

      def perform
        @client.connection.delete("/pref/#{@preference.user_id}/#{@preference.item_id}")
      end
    end
  end
end