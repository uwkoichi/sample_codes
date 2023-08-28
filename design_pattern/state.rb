# Stateパターン

<<-MEMO
オブジェクトの内部状態に応じて、オブジェクトの振る舞いを変更するデザインパターン。

メリット
単一責任の原則:
- 1つのクラスは一つの状態のみを管理する。
- 各状態が変更される場合に他の状態に影響を与えることなく、変更や追加ができる。

オープン/クローズの原則:
- 既存のコードを変更することなく新しい状態を簡単に追加することができる。
- 新しい状態を追加する場合、新しい State サブクラスを追加するだけ。

状態遷移の明確化:
- システムの状態遷移が理解しやすい

条件文の削減:
- ifやcase文を減らせる。

再利用性:
- 同じ状態のロジックを再利用したい場合、既存のStateクラスを使用できる。

拡張性:
- 新しい状態や振る舞いが必要になった場合、既存のコードを大きく変更することなく追加することができる。
MEMO


class State
  def play(context)
    raise NotImplementedError
  end

  def pause(context)
    raise NotImplementedError
  end

  def stop(context)
    raise NotImplementedError
  end
end

class PlayingState < State
  def play(context)
    puts "既に再生中です。"
  end

  def pause(context)
    puts "音楽を一時停止中..."
    context.state = PausedState.new
  end

  def stop(context)
    puts "音楽を停止中..."
    context.state = StoppedState.new
  end
end

class PausedState < State
  def play(context)
    puts "音楽を再開中..."
    context.state = PlayingState.new
  end

  def pause(context)
    puts "既に一時停止中です。"
  end

  def stop(context)
    puts "音楽を停止中..."
    context.state = StoppedState.new
  end
end

class StoppedState < State
  def play(context)
    puts "音楽を開始中..."
    context.state = PlayingState.new
  end

  def pause(context)
    puts "再生されていないので一時停止できません。"
  end

  def stop(context)
    puts "既に停止中です。"
  end
end

# Context クラスを定義
class AudioPlayer
  attr_accessor :state

  def initialize(state: StoppedState.new)
    @state = state
  end

  def play
    @state.play(self)
  end

  def pause
    @state.pause(self)
  end

  def stop
    @state.stop(self)
  end
end


player = AudioPlayer.new

player.play  # 出力: "音楽を開始中..."
player.play  # 出力: "既に再生中です。"
player.pause # 出力: "音楽を一時停止中..."
player.play  # 出力: "音楽を再開中..."
player.stop  # 出力: "音楽を停止中..."
