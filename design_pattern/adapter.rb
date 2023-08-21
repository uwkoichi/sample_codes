# Adapterパターン
## ひとことでいうとクラスのインターフェースをクライアントが要求する別のインターフェースに変換する。

# 既存のクラス
class Adaptee
  def specific_request
    "既存クラスのメソッドが呼び出されました"
  end
end

# ターゲットのインターフェース
class Target
  def request
    "ターゲットクラスのメソッドが呼び出されました"
  end
end

# アダプタークラス
class Adapter < Target
  def initialize(adaptee)
    @adaptee = adaptee
  end

  def request
    @adaptee.specific_request
  end
end

# 実行
adaptee = Adaptee.new
adapter = Adapter.new(adaptee)

adapter.request # 古いインターフェースの処理がよばれる（既存クラスの）


# 日本とアメリカの電源プラグの例で書く

# 日本の電源プラグ
class JapanesePlug
  def supply_power
    "100Vの電力を供給します。"
  end
end

# アメリカの電源プラグのインターフェース
class AmericanPlug
  def provide_electricity
    "120Vの電流を提供します。"
  end
end

# 日本の電源プラグをアメリカのインターフェースに適応させるAdapter
class PlugAdapter
  def initialize(japanese_plug)
    @japanese_plug = japanese_plug
  end

  def provide_electricity
    @japanese_plug.supply_power
  end
end

# クライアントコード
def use_plug(plug)
  puts plug.provide_electricity
end


# アダプターを使えば異なるインターフェースをクライアントを変更せずに適応できる
use_plug(PlugAdapter.new(JapanesePlug.new))  # => "100Vの電力を供給します。"
use_plug(AmericanPlug.new)  # => "120Vの電流を提供します。"

