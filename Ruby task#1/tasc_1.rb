class Cypher
  def crypt(key, text)
    answer_text = []
    text.each do |line|
      ans = ''
      line.each_byte do |c|
      if (c > 96) and (c < 123)
        if c + key > 122 
          ans << c + key - 26
        elsif c + key < 96
          ans << c + key + 26
        else ans << c + key
        end
      end
     end
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
encrypt_text = process.crypt(key, text)
puts "Encrypt text:"
encrypt_text.each { |e| puts e }
decrypt_text = process.crypt(-1 * key, encrypt_text)
puts "Decrypt text:"
decrypt_text.each { |e| puts e }