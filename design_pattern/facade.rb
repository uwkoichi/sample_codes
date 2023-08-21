# Facadeパターン（読み方はファサードwww）

# Facadeパターンとは
## クライアントから見てシンプルなアクセスポイントを提供しながら、背後の複雑なシステムを隠蔽する
## 最小知識の原則

class AccountSystem
  def authenticate(user, password)
    # 仮の実装: 実際にはユーザー情報のDBやAPIの確認が必要
    puts "Authenticating user #{user}"
    true  # ここでは常に認証成功とする
  end
end

class StreamingService
  def fetch_movie(title)
    # 仮の実装: 実際には動画のDBやストレージから動画を取得
    puts "Fetching movie #{title}"
    "Movie data for #{title}"  # 仮の動画データ
  end
end

class Player
  def play(movie_data)
    puts "Playing #{movie_data}"
  end
end

# Facade
class NetflixFacade
  def initialize(user, password)
    @user = user
    @account_system = AccountSystem.new
    @streaming_service = StreamingService.new
    @player = Player.new

    @authenticated = @account_system.authenticate(user, password)
  end

  def play_movie(title)
    if @authenticated
      movie_data = @streaming_service.fetch_movie(title)
      @player.play(movie_data)
    else
      puts "Authentication failed. Can't play the movie."
    end
  end
end

# クライアント側
NetflixFacade.new("Koichi", "password").play_movie("starwars")

# クライアント側はplay_movieをするだけで、その内部で何が行われているのか知る必要がない
