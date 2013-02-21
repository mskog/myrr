module Myrr
  module Methods
    class Estimate
      def initialize(client,user_id, item_id)
        @client = client
        @user_id = user_id
        @item_id = item_id
      end

      def perform
        response = @client.connection.get("/estimate/#{@user_id}/#{@item_id}")
        Myrr::Estimation.new(@user_id, @item_id, response.body)
      end
    end
  end
end