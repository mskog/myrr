module Myrr
  module Methods
    class MostSimilarItems
      include SanitizedOptions

      allow_options :how_many
      
      def initialize(client,item_ids,options={})
        @client = client
        @item_ids = Array(item_ids)
        @options = options
      end

      def perform
        response =
        @client.json_connection.get("/similarity/#{@item_ids.join('/')}") do |request|
          request.params.merge!(sanitized_options)
        end
        Recommendations.new(response.body.map{|rec| Recommendation.new(nil, rec[0], rec[1])})
      end
    end
  end
end