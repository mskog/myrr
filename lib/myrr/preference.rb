module Myrr
  Preference = Struct.new(:user_id, :item_id, :value) do
    def to_a
      values.compact
    end
  end
end