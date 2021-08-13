import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';

abstract class HomeRepository {
  Future<Result<Failure, WeatherEntity>> getWeather(DateTime date);
}
