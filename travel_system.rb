
class Travel
  # クラス変数にしないとうまくいかなかったので定義。ここはもう少し学習したい
  @@count = 0

  attr_accessor :place, :price
# 試験的にキーワード引数でデフォルト値を入れてみる
  def initialize(place: "未入力", price: 0)
    @place = place
    @price = price
    # インスタンス生成時に数字が上がれば良いのでいいと思い変更。検索したらいいのがあったので参考にしてみて変更
    @@count += 1
  end

  def info
    puts "NO.#{@@count} #{@place} #{@price.to_s.reverse.scan(/.{1,3}/).join(',').reverse}円"
  end

  def confirm
    puts "#{@place}ですね"
  end

end

# resultメソッドをクラス外へ出すように変更
def result(number,option,travels)
  if number >= 5
    cost = travels[option - 1][:price] * number * 0.9
    puts "５人以上なので合計#{cost.floor.to_s.reverse.scan(/.{1,3}/).join(',').reverse}円です"
  else
    cost = travels[option - 1][:price] * number
    puts "合計#{cost.floor}円です"
  end
end
