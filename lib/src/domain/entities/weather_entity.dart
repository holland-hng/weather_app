import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:weather_app/core/common/day.dart';
part 'weather_entity.g.dart';

@HiveType(typeId: WeatherEntity.typeId)
class WeatherEntity extends Equatable {
  static const int typeId = 0;
  @HiveField(0)
  final String weatherStateName;
  @HiveField(1)
  final String weatherStateAbbr;
  @HiveField(2)
  final String windDirectionCompass;
  @HiveField(3)
  final String created;
  @HiveField(4)
  final String applicableDate;
  @HiveField(5)
  final double minTemp;
  @HiveField(6)
  final double maxTemp;
  @HiveField(7)
  final double theTemp;
  @HiveField(8)
  final double windSpeed;
  @HiveField(9)
  final double windDirection;
  @HiveField(10)
  final double airPressure;
  @HiveField(11)
  final int humidity;
  @HiveField(12)
  final double visibility;
  @HiveField(13)
  final int predictability;

  WeatherEntity({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  String get dateString {
    try {
      var _parsedDate = DateTime.parse(this.applicableDate);
      String _result = _parsedDate.weekday.getWeekDayString() +
          " " +
          _parsedDate.month.getMonthString() +
          " " +
          _parsedDate.day.toString() +
          ", " +
          _parsedDate.year.toString();
      return _result;
    } catch (e) {
      return "";
    }
  }

  @override
  List<Object?> get props => [applicableDate];
}
