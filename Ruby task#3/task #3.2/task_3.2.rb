def safe_invert(my_hash)
  answer_hash = Hash.new { |hash,key| hash[key] = []}
  my_hash.each { |key, value|
    answer_hash[value] = answer_hash[value] << key }
  answer_hash 
end

fruits_country = {
'orange' => 'Marocco',
'banana' => 'Ecuador',
'lemon' => 'Marocco',
}

safe_invert(fruits_country).each do |key, value|
  puts " key : #{key} have value: #{value}"
 end