# Factoryパターン
# Factoryメソッドを通じてオブジェクトを作成する
# case文とかでオブジェクトごとの分岐とか見たらリファクタできる
# メソッドが実装されてなかったらNotImplementedErrorをraiseするので、実装漏れを防げる

class Animal
  def speak
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Dog < Animal
  def speak
    'ワン'
  end
end

class Cat < Animal
  def speak
    'にゃーーーーー'
  end
end

class AnimalFactory
  def self.build(type)
    case type
    when 'dog'
      Dog.new
    when 'cat'
      Cat.new
    else
      raise "#{type}という種類はないです"
    end
  end
end

# Client code
p AnimalFactory.build('dog').speak
p AnimalFactory.build('cat').speak
