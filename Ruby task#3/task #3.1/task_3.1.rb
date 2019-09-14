require 'date'
puts "Enter the date in format yyyy-mm-dd"
date = gets.chomp
puts "Chose the unit. d - day, m - month, y - year"
unit = gets.chomp.to_sym
puts "Enter step"
step = gets.chomp.to_i
puts "Enter number of step"
number_of_steps = gets.chomp.to_i

date = Date.parse date

step_hash = { :d => lambda { |date| date.next_day(step)},
              :m => lambda { |date| date.next_month(step)},
              :y => lambda { |date| date.next_year(step)} }

number_of_steps.times.with_index { |i|
  date = step_hash[unit].call(date)
  puts "step #{i + 1}: date - #{date}" }