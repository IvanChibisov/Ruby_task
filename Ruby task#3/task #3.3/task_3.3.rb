class Array
  def get_hash()
    answer_hash = Hash.new { |hash,key| hash[key] = 0}
    self.each  { |e| answer_hash[e] = answer_hash[e] + 1 }
    answer_hash 
  end
end

fruits = ["orange","banana","banana","banana","lemon","lemon"]

fruits.get_hash().each do |key, value|
  puts "key : #{key} contained #{value} times" 
end
