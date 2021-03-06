require "./travel_system"

puts <<~TEXT
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
旅行先を選択してください
価格は１人あたりの代金（税抜き）です
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
TEXT

# インスタンス生成のためのデータをハッシュに一度格納するに変更
# ハッシュの中に入れる配列の見やすい書き方に変更
travel_params = [ 
  {place: "九州", price: 15000},
  {place: "北海道", price: 20000},
  {place: "沖縄", price: 10000}
]

# 生成時にinitializeメソッドが働くので、生成とinfoメソッドを配列で同時に生成
# 
travels = travel_params.map { |param| Travel.new(**param)}
travels.each {|travel| travel.info}


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
puts "#{travels[option - 1].place}ですね"

# 人数の確認
print "人数を教えてください<< "
number = gets.chomp.tr("０-９","0-9").to_i

# 人数に関してもチェック追加
until number >= 1
  puts "-------------------"
  print "人数は１人以上にしてください"
  number = gets.chomp.tr("０-９","0-9").to_i
end

  # resultメソッドをインスタンスメソッドから外すよう変更
puts "-------------------"
result(number,option,travels)
