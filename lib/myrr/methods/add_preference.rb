module Myrr
  module Methods
    class AddPreference
      def initialize(client,preference)
        @client = client
        @preference = preference
      end

      def perform
        @client.connection.post("/pref/#{@preference.user_id}/#{@preference.item_id}") do |request|
          request.body = @preference.value.to_s
        end
      end
    end
  end
end