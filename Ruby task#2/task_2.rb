# Complete the function below.

# DO NOT MODIFY anything outside the below function
def twins(a, b)
  even_a = []
  even_b = []
  odd_a = []
  odd_b = []
  i = 0
  a.each_char {|_| i % 2 == 0 ? even_a << a[i] : odd_a << a[i]
    i = i + 1  } 
  i = 0
  b.each_char {|_| i % 2 == 0 ? even_b << b[i] : odd_b << b[i] 
    i = i + 1  } 

  sort_a_even = even_a.sort
  sort_b_even = even_b.sort
  sort_a_odd = odd_a.sort
  sort_b_odd = odd_b.sort

  even_equal = []
  sort_a_even.each_index {|i| 
    if sort_a_even[i] == sort_b_even[i] 
      even_equal << true 
    else
      even_equal << false
    end }

  bool_ans = even_equal.all?
  string_ans = ''
  if bool_ans
    odd_equal = []
    sort_a_odd.each_index {|i| 
      if sort_a_odd[i] == sort_b_odd[i] 
        odd_equal << true 
      else
        odd_equal << false
      end }
    bool_ans = odd_equal.all?
    if bool_ans
      string_ans = 'Yes'
    else
      string_ans = 'No'
    end
  else
    string_ans = 'No'
  end  
  string_ans
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