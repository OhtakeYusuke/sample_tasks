# 内部動作

class Travel
  attr_accessor :place, :price, :number
# 試験的にキーワード引数でデフォルト値を入れてみる
  def initialize(place: "未入力", price: 0, number: 1)
    @place = place
    @price = price
    @number = number
  end

  def info
    puts "#{@place} #{@price}円"
  end

  def confirm
    puts "#{@place}ですね"
  end

  def result
    if @number >= 5
      cost = @price * @number * 0.9
      puts "５人以上なので合計#{cost.floor}円です"
    else
      cost = @price * @number
      puts "合計#{cost.floor}円です"
    end
  end
end

travel1 = Travel.new(place: "沖縄", price: 154682)

def digits
  self.to_s.reverse.scan(/.{1,3}/).join(',').reverse
end

p travel1.price.digits
