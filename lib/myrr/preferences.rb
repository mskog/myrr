module Myrr
  class Preferences
    include Enumerable

    def initialize
      @preferences = Array.new
    end

    def <<(preference)
      @preferences << preference
    end

    def each(&block)
      @preferences.each {|pref| yield pref}
    end

    def to_csv
      CSV.generate do |csv|
        self.to_a.each{|preference| csv << preference}
      end
    end

    def to_a
      self.map(&:to_a)
    end
  end
end