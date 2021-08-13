import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/core/common/json_mapable.dart';
part 'weather_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponse implements JsonMapable<WeatherResponse> {
  final String id;
  @JsonKey(name: "weather_state_name", defaultValue: "")
  final String weatherStateName;
  @JsonKey(name: "weather_state_abbr", defaultValue: "")
  final String weatherStateAbbr;
  @JsonKey(name: "wind_direction_compass", defaultValue: "")
  final String windDirectionCompass;
  @JsonKey(defaultValue: "")
  final String created;
  @JsonKey(name: "applicable_date", defaultValue: "")
  final String applicableDate;
  @JsonKey(name: "min_temp", defaultValue: 0.0)
  final double minTemp;
  @JsonKey(name: "max_temp", defaultValue: 0.0)
  final double maxTemp;
  @JsonKey(name: "the_temp", defaultValue: 0.0)
  final double theTemp;
  @JsonKey(name: "wind_speed", defaultValue: 0.0)
  final double windSpeed;
  @JsonKey(name: "wind_direction", defaultValue: 0.0)
  final double windDirection;
  @JsonKey(name: "air_pressure", defaultValue: 0.0)
  final double airPressure;
  @JsonKey(defaultValue: 0)
  final int humidity;
  @JsonKey(defaultValue: 0.0)
  final double visibility;
  @JsonKey(defaultValue: 0)
  final int predictability;

  WeatherResponse({
    required this.id,
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

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  toJson() => _$WeatherResponseToJson(this);
}
