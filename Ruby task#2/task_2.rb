# Complete the function below.

# DO NOT MODIFY anything outside the below function
def twins(a, b)
  even_a_hash = Hash.new { |hash,key| hash[key] = 0 }
  even_b_hash = Hash.new { |hash,key| hash[key] = 0 }
  odd_a_hash = Hash.new { |hash,key| hash[key] = 0 }
  odd_b_hash = Hash.new { |hash,key| hash[key] = 0 }
  a.each_with_index {|_, i| i % 2 == 0 ? even_a_hash[a[i]] += 1 : odd_a_hash[a[i]] += 1} 
  b.each_with_index {|_, i| i % 2 == 0 ? even_b_hash[b[i]] += 1 : odd_b_hash[b[i]] += 1} 
  answer = true
  odd_a_hash.each_key do |key| 
    if odd_a_hash[key] != odd_b_hash[key] 
      answer = false
      break
    end
  end
  even_a_hash.each_key do |key|
    if even_a_hash[key] != even_b_hash[key]
      answer = false
      break 
    end
  end
  answer ? 'Yes' : 'No'
end



# DO NOT MODIFY anything outside the above function

# DO NOT MODIFY THE CODE BELOW THIS LINE!
_a_cnt = Integer(gets)
_a_i=0
_a = Array.new(_a_cnt)

while (_a_i < _a_cnt)
  _a_item = gets.to_s.strip;
  _a[_a_i] = (_a_item)
  _a_i+=1
end

_b_cnt = Integer(gets)
_b_i=0
_b = Array.new(_b_cnt)

while (_b_i < _b_cnt)
  _b_item = gets.to_s.strip;
  _b[_b_i] = (_b_item)
  _b_i+=1
end

res = twins(_a, _b);
for res_i in res do
  puts res_i
end