import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/core/common/format_date.dart';
import 'package:weather_app/core/database/database.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';

abstract class WeatherLocalDataSource {
  /// Gets the cached WeatherEntity
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  WeatherEntity getWeather(DateTime date);

  void cacheWeather(WeatherEntity triviaToCache);
}

@Singleton(as: WeatherLocalDataSource)
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  var _box = Hive.box(Database.hiveBoxName);
  @override
  void cacheWeather(WeatherEntity weatherEntity) {
    _box.put(weatherEntity.applicableDate, weatherEntity);
  }

  @override
  WeatherEntity getWeather(DateTime date) {
    try {
      String _key = date.year.toString() +
          "-" +
          FormatDate.format(date.month.toString()) +
          "-" +
          FormatDate.format(date.day.toString());
      var _entity = _box.get(_key);
      return _entity;
    } catch (e) {
      throw CacheException();
    }
  }
}
