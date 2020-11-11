class Foo
  def initialize(user: "悠介", age: 27, height: 170)
    @user = user
    @age = age
    @height = height
  end

  def users
    puts @user
  end

end

hashes = [
  {user: "太郎",age: 10, height: 120},
  {user: "次郎",age: 39, height: 180},
  {user: "花子",age: 26, height: 159}
]

user_test = hashes.map do |hash|
  Foo.new(**hash).users
end

puts user_test
