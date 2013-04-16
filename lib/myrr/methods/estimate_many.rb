module Myrr
  module Methods
    class EstimateMany
      def initialize(client,user_id, item_ids)
        @client = client
        @user_id = user_id
        @item_ids = item_ids
      end

      def perform
        response = @client.connection.get("/estimate/#{@user_id}/#{joined_item_ids}")
        response.body.lines.map.with_index do |value, index|
          Myrr::Estimation.new(@user_id, @item_ids[index], value.to_f)
        end
      end

    private
      def joined_item_ids
        @item_ids.join('/')
      end
    end
  end
end