# Proxyパターン

<<-MEMO
用途:
- 遅延初期化 (Lazy Initialization)
  - ブジェクトの生成コストが高い場合や、オブジェクトが必要になるまで生成を遅らせたい場合
- アクセス制御
- ログ記録
  - アクセスをログとして記録する必要がある場合
MEMO

# Subject インターフェース
class RealSubject
  def request
    "何かしらのリクエスト"
  end
end


class Proxy
  def initialize(real_subject)
    @real_subject = real_subject
  end

  def request
    # 何かしらの処理を行う（例えば、アクセスの制御、遅延初期化、ログの記録など）
    if check_access
      result = @real_subject.request
      log_access
      result
    else
      "Access Denied."
    end
  end

  private

  def check_access
    true
  end

  def log_access
    puts "Proxy: Logged request."
  end
end

Proxy.new(RealSubject.new).request
