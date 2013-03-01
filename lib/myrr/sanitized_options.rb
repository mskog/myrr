module Myrr
  module SanitizedOptions
    def self.included(base)
      base.extend(ClassMethods)
    end

    def sanitized_options
      @options.inject({}) do |hash, (key, value)|
        hash[key.to_s.camelize_all_but_first] = value if self.class.allowed_options.include?(key)
        hash
      end
    end

    module ClassMethods
      def allow_options(*options)
        @allowed_options = options
      end

      def allowed_options
        @allowed_options
      end
    end
  end
end