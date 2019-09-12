$stdin = File.open('output.txt')
$stdout = File.open('input.txt', 'w')
line = gets
k = line.to_i
while line = gets
  ans = ''
  line.each_byte { |c|
			if (c > 96) and (c < 123)
                      		if c - k < 96 
			  		ans << c - k + 26
                      		else ans << c - k
                    		end
			end }
  puts ans
end