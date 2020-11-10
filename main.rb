require "./travel_system"

puts <<~TEXT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
旅行先を選択してください
価格は１人あたりの代金（税抜き）です
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TEXT

# インスタンス生成のためのデータをハッシュに一度格納するに変更
travels = [ {place: "九州", price: 15000},
            {place: "北海道", price: 20000},
            {place: "沖縄", price: 10000}
]

# 生成時にinitializeメソッドが働くので、生成とinfoメソッドを配列で同時に生成
travels.each do |travel|
  Travel.new(place: travel[:place], price: travel[:price]).info
end

print "行き先を番号で選択してください<< "
option = gets.chomp.tr("０-９","0-9").to_i

# Rangeクラスが使えないか試行錯誤してみたけれどうまくいかず・・・もう少し考えてみます
until option <= travels.size && option >= 1
  puts "---------------------"
  print "入力が違います。もう一度お願いします<< "
    option = gets.chomp.tr("０-９","0-9").to_i
end

# option - 1 がもっとみやすくならないか考え中
puts "-------------------"
puts "#{travels[option - 1][:place]}ですね"

  # 人数の確認
print "人数を教えてください<< "
number = gets.chomp.tr("０-９","0-9").to_i

  # resultメソッドをインスタンスメソッドから外すよう変更
puts "-------------------"
result(number,option,travels)
