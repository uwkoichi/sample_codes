# 社員は仕事をするのでworkという振る舞いは変わらない
# 職種によってworkの内容は変わるので、それぞれの職種のクラスにworkというロジックを持たせる

class Employee
  attr_reader :name, :age, :occupation

  def initialize(name, age, occupation)
    @name = name
    @age = age
    @occupation = occupation
  end

  def work
    occupation.work
  end
end

class Engineer
  def work
    # エンジニアの仕事
  end
end

class Sales
  def work
    # セールスの仕事
  end
end

class Labor
  def work
    # 労務の仕事
  end
end

Employee.new('赤間滉一', 24, Engineer.new).work
