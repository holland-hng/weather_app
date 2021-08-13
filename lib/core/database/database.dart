import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';

class Database {
  static const hiveBoxName = 'WeatherApp';
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WeatherEntityAdapter());

    await Hive.openBox(hiveBoxName);
  }
}
