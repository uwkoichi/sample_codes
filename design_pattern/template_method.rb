# Template Methodパターン

<<-MEMO
--------- Tempate Methodパターンとは --------- 
- サブクラスがアルゴリズムの手順の実装方法を決める
- 処理の骨組みや一連のステップをスーパークラスに定義し、その詳細な実装をサブクラスに委ねる

--------- 抽象メソッドを使うか、フックを使うかの基準について ---------
抽象メソッド
- 目的: サブクラスでの実装が必須であることを示す。
- 特徴: スーパークラスでは具体的な実装を持たず、サブクラスでのオーバーライドが必須。
- 使用時のガイドライン:
  - サブクラスごとに異なる動作や実装が必要な場合。
  - サブクラスがその動作を提供しなければ、全体のアルゴリズムやプロセスが意味をなさない場合。

フック
- 目的: サブクラスでの実装をオプショナルにする。サブクラスが必要に応じてテンプレートメソッドの一部の動作をカスタマイズするためのポイントを提供。
- 特徴: スーパークラスではデフォルトの実装を持つことが多く、サブクラスでのオーバーライドはオプショナル。
- 使用時のガイドライン:
  - サブクラスが特定のステップをカスタマイズしたい場合。
  - すべてのサブクラスで共通のデフォルト動作があり、一部のサブクラスだけで動作を変更したい場合。
  - サブクラスがその動作を提供しなくても、全体のアルゴリズムやプロセスが成り立つ場合。

まとめ
- サブクラスでの実装が絶対に必要な動作やステップがある場合、それは抽象メソッドとして定義する。
- サブクラスに柔軟性を提供するため、またはオプショナルなカスタマイズポイントを提供する場合、フックを使用する。

MEMO

class Beverage
  def prepare
    boil_water
    brew
    pour_in_cup
    add_condiments if customer_wants_condiments?
  end

  def boil_water
    puts "沸騰させる"
  end

  def pour_in_cup
    puts "カップに注ぐ"
  end

  # 抽象クラス: サブクラスでの実装が必須
  def brew
    raise NotImplementedError
  end

  def add_condiments
    raise NotImplementedError
  end

  # フック: デフォルトはtrue。サブクラスでのオーバーライドはオプショナル
  def customer_wants_condiments?
    true
  end
end

class Tea < Beverage
  def brew
    puts "紅茶を淹れる"
  end

  def add_condiments
    puts "レモンを入れる"
  end
end

class Coffee < Beverage
  def brew
    puts "コーヒーを淹れる"
  end

  def add_condiments
    puts "砂糖と牛乳を入れる"
  end

  def customer_wants_condiments?
    false
  end
end

Tea.new.prepare
Coffee.new.prepare
