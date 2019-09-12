class Cypher
  def crypt(key, text)
    answer_text = []
    text.each do |line|
      ans = yield key, line
      answer_text << ans
    end
    answer_text
  end  
end


key = 3
text = []
file = "input.txt"
$stdin = File.open(file)
while line = gets
  text << line
end
process = Cypher.new
encrypt_text = process.crypt(key, text) do |k, line; ans|
  ans = ''
  line.each_byte do |c|
    if (c > 96) and (c < 123)
      if c + k > 122 
        ans << c + k - 26
      else ans << c + k
      end
    end
  end 
 ans
 end
puts "Encrypt text:"
encrypt_text.each { |e| puts e }
decrypt_text = process.crypt(key, encrypt_text) do |k, line; ans|
  ans = ''
  line.each_byte do |c|
    if (c > 96) and (c < 123)
      if c - k < 96 
        ans << c - k + 26
      else ans << c - k
      end
    end
  end 
 ans
 end
puts "Decrypt text:"
decrypt_text.each { |e| puts e }