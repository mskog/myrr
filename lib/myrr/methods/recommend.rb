module Myrr
  module Methods
    class Recommend
      def initialize(client,user_id,options={})
        @client = client
        @user_id = user_id
        @options = options
      end

      def perform
        @client.json_connection.get("/recommend/#{@user_id}") do |request|
          request.params.merge!(@options)
        end
      end
    end
  end
end