module Myrr
  module Methods
    class Recommend
      include SanitizedOptions

      allow_options :how_many, :consider_known_items
      
      def initialize(client,user_id,options={})
        @client = client
        @user_id = user_id
        @options = options
      end

      def perform
        response =
        @client.json_connection.get("/recommend/#{@user_id}") do |request|
          request.params.merge!(sanitized_options)
        end
        Recommendations.new(response.body.map{|rec| Recommendation.new(@user_id, rec[0], rec[1])})
      end
    end
  end
end