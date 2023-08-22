# decoratorパターン

<<-MEMO
オブジェクトに動的に新しい責任を追加するためのデザインパターン。
このパターンはサブクラス化を使って機能を拡張する代わりに、オブジェクトのラップを行って機能を追加または変更する

メリット
再利用性:
- 同じデコレータを異なるコンポーネントで再利用することができる。一度定義されたデコレータは、様々な場面やコンテキストで再利用可能。

単一の責任原則: 
- それぞれのデコレータは特定の機能や責任だけを担う。これにより、各デコレータが単一の役割を持つことができ、システム全体のメンテナンスや拡張が容易になる。

オープン/クローズド原則の遵守:
- デコレーターパターンは、既存のコードを変更せずに新しい機能を追加できるため、オープン/クローズド原則に従っている。

過度なサブクラスの生成を回避:
- 各機能や変更ごとに新しいサブクラスを作成する必要がなくなる。多くのサブクラスが存在する場合、それぞれの組み合わせに対してサブクラスを作成する必要があるため、デコレーターパターンを使用すると、このような複雑さを大幅に削減できる。

合成の鼓励:
- デコレーターパターンは、オブジェクトの機能を動的に組み合わせることを鼓励する。これは、継承よりも合成を使用することの利点を示している。
MEMO

# コンポーネントクラス
class Coffee
  def cost
    50
  end

  def ingredients
    "コーヒー"
  end
end

# デコレーター基底クラス
class CoffeeDecorator
  def initialize(coffee)
    @coffee = coffee
  end

  def cost
    @coffee.cost
  end

  def ingredients
    @coffee.ingredients
  end
end

# ミルクを追加するデコレータ
class WithMilk < CoffeeDecorator
  def cost
    super + 20
  end

  def ingredients
    super + ", ミルク"
  end
end

# 砂糖を追加するデコレータ
class WithSugar < CoffeeDecorator
  def cost
    super + 10
  end

  def ingredients
    super + ", 砂糖"
  end
end

# 使い方
coffee = Coffee.new
puts "コスト: #{coffee.cost}; 材料: #{coffee.ingredients}"

milk_coffee = WithMilk.new(coffee)
puts "コスト: #{milk_coffee.cost}; 材料: #{milk_coffee.ingredients}"

sugar_milk_coffee = WithSugar.new(milk_coffee)
puts "コスト: #{sugar_milk_coffee.cost}; 材料: #{sugar_milk_coffee.ingredients}"
