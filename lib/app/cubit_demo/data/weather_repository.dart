import 'dart:math';

import 'model/weather.dart';

abstract class WeatherRepository {
  /// 抛出异常 [NetworkException].
  Future<Weather> fetchWeather(String cityName);
}

class FakeWeatherRepository implements WeatherRepository {
  @override
  Future<Weather> fetchWeather(String cityName) {
    // 模拟天气延迟
    return Future.delayed(
      Duration(seconds: 1),
      () {
        final random = Random();
        // 模拟天气异常
        if (random.nextBool()) {
          throw NetworkException();
        }
        // 返回以获取天气数据
        return Weather(
          cityName: cityName,
          // 温度范围在 20～35.99
          temp: 20 + random.nextInt(15) + random.nextDouble(),
        );
      },
    );
  }
}

class NetworkException implements Exception {}
