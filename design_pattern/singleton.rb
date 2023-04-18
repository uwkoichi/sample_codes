# singletonパターン
# インスタンスが1つしか存在しない唯一無二のオブジェクトを作成するための手段
# グローバルな状態管理をしたい時に使えそう
# テスト書くのキツそう
# 正しく使わないとカオスになりそう


# モジュールを使わない場合
class MySingleton
  @@instance = MySingleton.new

  def self.instance
    @@instance
  end

  def initialize
    @counter = 0
  end

  def increment_counter
    @counter += 1
  end

  def get_counter
    @counter
  end

  private_class_method :new
end

s1 = MySingleton.instance
s2 = MySingleton.instance

s1.increment_counter
s2.increment_counter

puts s1.get_counter # => 2
puts s2.get_counter # => 2


# singletonモジュールを使う場合
require 'singleton'

class MySingleton
  include Singleton

  def initialize
    @counter = 0
  end

  def increment_counter
    @counter += 1
  end

  def get_counter
    @counter
  end
end

s1 = MySingleton.instance
s2 = MySingleton.instance

s1.increment_counter
s2.increment_counter

puts s1.get_counter # => 2
puts s2.get_counter # => 2
