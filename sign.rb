print "数値を入力してください: "
num = gets.to_i

if num > 0
  puts "正です"
elsif num < 0
  puts "負です"
else
  puts "0です"
end