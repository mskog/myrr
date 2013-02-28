module Myrr
  class Recommendation
    def initialize(user_id, item_id, value)
      @user_id = user_id
      @item_id = item_id
      @value = value
    end

    def to_a
      [@user_id, @item_id, @value]
    end
  end
end