require "./travel_system"

# 旅行先のインスタンス

travel2 = Travel.new(place: "北海道", price: 20000)
travel3 = Travel.new(place: "九州", price: 15000)
travels = [travel1, travel2, travel3]

puts <<~TEXT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  旅行先を選択してください
  価格は１人あたりの代金（税抜き）です
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TEXT

# 旅行先の提示
travels.each.with_index(1) do |travel, i|
  print "No.#{i} "
  travel.info
end

print "行き先を番号で選択してください<< "
option = gets.chomp.tr("０-９","0-9").to_i

# 番号不一致のときの対処
while option > 3 
  puts "---------------------"
  print "入力が違います。もう一度お願いします<< "
    option = gets.chomp.tr("０-９","0-9").to_i
end

# 行き先の確認
puts "-------------------"
  case option
  when 1
    travel1.confirm
    travel = travel1
  when 2
    travel2.confirm
    travel = travel2
  when 3
    travel3.confirm
    travel = travel3
  end

  # 人数の確認
print "人数を教えてください<< "
number = gets.chomp.tr("０-９","0-9").to_i

  # 確定料金の確認
puts "-------------------"
travel = Travel.new(place: travel.place, price: travel.price, number: number)
travel.result
puts "-------------------"
