module Myrr
  class Recommendations
    include Enumerable

    def initialize(items=[])
      @recommendations = Array(items)

    end

    def <<(preference)
      @recommendations << preference
    end

    def each(&block)
      @recommendations.each {|pref| yield pref}
    end

    def to_a
      self.map(&:to_a)
    end
  end
end