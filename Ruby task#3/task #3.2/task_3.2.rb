class Hash
  def safe_invert()
    answer_hash = Hash.new { |hash,key| hash[key] = []}
    self.each { |key, value| answer_hash[value] = answer_hash[value] << key }
    answer_hash 
  end
end

fruits_country = {
'orange' => 'Marocco',
'banana' => 'Ecuador',
'lemon' => 'Marocco',
}

fruits_country.safe_invert().each do |key, value|
  puts " key : #{key} have value: #{value}"
 end
