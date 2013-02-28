module Myrr
  module Methods
    class Recommend
      ALLOWED_OPTIONS = [:how_many, :consider_known_items]
      
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
        Recommendations.new(response.body.map{|rec| rec.unshift(@user_id)})
      end

      private

      def sanitized_options
        @options.inject({}) do |hash, (key, value)|
          hash[key.to_s.camelize_all_but_first] = value if ALLOWED_OPTIONS.include?(key); hash
        end
      end
    end
  end
end