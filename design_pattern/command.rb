# Commandパターン
# リモコンはコマンドの中身を知らなくて良い（カプセル化）
# リモコンは実行されたコマンドの履歴くらいしか知らなくて良い
# コマンドの中身(実装部分)はそれぞれのコマンドクラスにあるので、コマンドの使い捨てが容易

# コマンドインターフェース
class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# テキストを表示するコマンド
class ShowTextCommand < Command
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def execute
    puts text
  end
end

# テキストを保存するコマンド
class SaveTextCommand < Command
  attr_reader :text, :filename

  def initialize(text, filename)
    @text = text
    @filename = filename
  end

  def execute
    File.write(filename, text)
    puts "Saved text to #{filename}."
  end
end

# コマンドを実行するリモコンみたいなクラス
class Rimocon
  def initialize
    @history = []
  end

  def execute(command)
    command.execute
    @history << command
  end

  def undo_last_command
    last_command = @history.pop
    last_command.execute if last_command
  end
end


rimocon = Rimocon.new
show_command = ShowTextCommand.new("Hello, world!")
save_command = SaveTextCommand.new("Hello, world!", "hello.txt")

rimocon.execute(show_command)
rimocon.execute(save_command)

rimocon.undo_last_command
