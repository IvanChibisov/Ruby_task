def get_hash(array)
  answer_hash = Hash.new { |hash,key| hash[key] = 0}
  array.each  { |e| answer_hash[e] = answer_hash[e] + 1 }
  answer_hash 
end

fruits = ["orange","banana","banana","banana","lemon","lemon"]

get_hash(fruits).each { |key, value|
  puts "key : #{key} contained #{value} times" }