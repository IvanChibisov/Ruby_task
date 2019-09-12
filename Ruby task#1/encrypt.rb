$stdin = File.open('input.txt')
$stdout = File.open('output.txt', 'w')
line = gets
k = line.to_i
while line = gets
  ans = ''
  line.each_byte { |c|
			if (c > 96) and (c < 123)
                      		if c + k > 122 
			  		ans << c + k - 26
                      		else ans << c + k
                    		end
			end }
  puts ans
end