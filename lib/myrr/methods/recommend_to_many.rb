module Myrr
  module Methods
    class RecommendToMany
      include SanitizedOptions

      allow_options :how_many, :consider_known_items

      def initialize(client,user_ids,options={})
        @client = client
        @user_ids = user_ids
        @options = options
      end

      def perform
        response =
        @client.json_connection.get("/recommendToMany/#{user_ids_parameters}") do |request|
          request.params.merge!(sanitized_options)
        end
        Recommendations.new(response.body.map{|rec| Recommendation.new(nil, rec[0], rec[1])})
      end


      private

      def user_ids_parameters
        @user_ids.join(',')
      end
    end
  end
end