class Cypher
  def encrypt(key, file)
    $stdin = File.open(file)
    text = []
    while line = gets
      ans = ''
      line.each_byte do |c|
      if (c > 96) and (c < 123)
          if c + key > 122 
            ans << c + key - 26
          else ans << c + key
          end
        end 
      end
      text << ans
    end
    text
  end

  def decrypt(key, text)
    answer_text = []
    text.each do |line|
      ans = ''
      line.each_byte do |c|
      if (c > 96) and (c < 123)
          if c - key < 96 
            ans << c - key + 26
          else ans << c - key
          end
        end 
      end
      answer_text << ans
    end
    answer_text
  end  
end


key = 3
file = "input.txt"
process = Cypher.new
encrypt_text = process.encrypt(key, file)
puts "Encrypt text:"
encrypt_text.each { |e| puts e }
decrypt_text = process.decrypt(key, encrypt_text)
puts "Decrypt text:"
decrypt_text.each { |e| puts e }
