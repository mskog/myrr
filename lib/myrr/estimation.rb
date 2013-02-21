module Myrr
  class Estimation
    attr_reader :user_id, :item_id, :value

    def initialize(user_id, item_id, value)
      @user_id = user_id
      @item_id = item_id
      @value = value.to_f
    end
  end
end