module Myrr
  module Methods
    class Ingest
      def initialize(client,preferences)
        @client = client
        @preferences = preferences
      end

      def perform
        @client.connection.post("/ingest") do |request|
          request.body = @preferences.to_csv
        end
      end
    end
  end
end