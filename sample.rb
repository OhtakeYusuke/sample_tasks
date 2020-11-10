
class Travel
  @@count = 0

  attr_accessor :place, :price, :number
# 試験的にキーワード引数でデフォルト値を入れてみる
  def initialize(place: "未入力", price: 0, number: 1)
    @place = place
    @price = price
    @@count += 1
    @number = number
  end

  def info
    puts "NO.#{@@count} #{@place} #{@price.to_s.reverse.scan(/.{1,3}/).join(',').reverse}円"
  end


  def confirm
    puts "#{@place}ですね"
  end

  def result
    if @number >= 5
      cost = @price * @number * 0.9
      puts "５人以上なので合計#{cost.floor.to_s.reverse.scan(/.{1,3}/).join(',').reverse}円です"
    else
      cost = @price * @number
      puts "合計#{cost.floor}円です"
    end
  end
end





travels = [ {place: "九州", price: 15000},
            {place: "北海道", price: 20000},
            {place: "沖縄", price: 10000}
]

travels.each do |travel|
  Travel.new(place: travel[:place], price: travel[:price]).info
end
