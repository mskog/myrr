module Myrr
  class Preference
    attr_reader :user_id, :item_id, :value

    def initialize(user_id, item_id, value=nil)
      @user_id = user_id
      @item_id = item_id
      @value = value
    end

    def to_a
      [@user_id, @item_id, @value].compact
    end
  end
end