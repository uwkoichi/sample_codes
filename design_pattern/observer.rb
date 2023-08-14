# Observerパターン
# あるオブジェクトの状態が変更されたときに、そのオブジェクトを「観察」している他のオブジェクトにその変更を通知する設計パターン
# 書籍では気象観測アプリケーションの例だったので、それをrubyで書く

# Subject（観察される側）
class WeatherStation
  attr_accessor :temperature, :humidity, :pressure

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(temperature, humidity, pressure)
    end
  end

  def measurements_changed
    notify_observers
  end

  def set_measurements(temperature, humidity, pressure)
    @temperature = temperature
    @humidity = humidity
    @pressure = pressure
    measurements_changed
  end
end

# Observer（観察する側）と具体的なディスプレイの例
class CurrentConditionsDisplay
  def update(temperature, humidity, _pressure)
    puts "現在の天気: 気温#{temperature}°C, 湿度#{humidity}%"
  end
end

class ForecastDisplay
  def update(_temperature, _humidity, pressure)
    if pressure > 1020
      puts "予報: 晴れ"
    else
      puts "予報: 雨"
    end
  end
end

# サンプルの動作
station = WeatherStation.new

current_display = CurrentConditionsDisplay.new
forecast_display = ForecastDisplay.new

station.add_observer(current_display)
station.add_observer(forecast_display)

station.set_measurements(25, 65, 1025)
station.set_measurements(22, 70, 1015)

# 出力:
# 現在の天気: 気温25°C、 湿度65%
# 予報: 晴れ
# 現在の天気: 気温22°C、 湿度70%
# 予報: 雨
