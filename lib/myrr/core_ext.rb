String.class_eval do
  def camelize
    self.split(/[^a-z0-9]/i).map{|word| word.capitalize}.join.sub(/^[A-Z]/) {|character| character.downcase }
  end
end