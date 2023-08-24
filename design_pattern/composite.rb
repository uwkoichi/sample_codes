# Compositeパターン

<<-MEMO
- 個別のオブジェクトとオブジェクトのコレクションを同じように扱えるようにする
  - 部分-全体の関係を持つオブジェクトの階層を扱う場合に使える

- ツリー構造のオブジェクトの形成に適している
  - ファイルシステム、組織の部門構造など
MEMO

class MenuItem
  def display
    raise NotImplementedError
  end
end

class SingleItem < MenuItem
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display
    puts "商品名: #{name}, 価格: #{price}"
  end
end

class Menu < MenuItem
  attr_reader :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add(item)
    @items << item
  end

  def remove(item)
    @items.delete(item)
  end

  def display
    puts "====== #{name} ======"
    @items.each(&:display)
  end
end

main_menu = Menu.new('ランチメニュー')

drinks_menu = Menu.new('ドリンク')
drinks_menu.add(SingleItem.new('コーラ', 2.5))
drinks_menu.add(SingleItem.new('コーヒー', 3.0))

food_menu = Menu.new('フードメニュー')
food_menu.add(SingleItem.new('ハンバーグ', 7.5))
food_menu.add(SingleItem.new('ピザ', 8.5))

main_menu.add(drinks_menu)
main_menu.add(food_menu)

main_menu.display
