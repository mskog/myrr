module Myrr
  module Methods
    class MostPopularItems
      include SanitizedOptions

      allow_options :how_many, :consider_known_items
      
      def initialize(client,options={})
        @client = client
        @options = options
      end

      def perform
        response =
        @client.json_connection.get("/mostPopularItems") do |request|
          request.params.merge!(sanitized_options)
        end
        Recommendations.new(response.body.map{|rec| Recommendation.new(@user_id, rec[0], rec[1])})
      end
    end
  end
end