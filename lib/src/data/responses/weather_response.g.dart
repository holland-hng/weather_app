// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) {
  return WeatherResponse(
    id: json['id'] as String,
    weatherStateName: json['weather_state_name'] as String? ?? '',
    weatherStateAbbr: json['weather_state_abbr'] as String? ?? '',
    windDirectionCompass: json['wind_direction_compass'] as String? ?? '',
    created: json['created'] as String? ?? '',
    applicableDate: json['applicable_date'] as String? ?? '',
    minTemp: (json['min_temp'] as num?)?.toDouble() ?? 0.0,
    maxTemp: (json['max_temp'] as num?)?.toDouble() ?? 0.0,
    theTemp: (json['the_temp'] as num?)?.toDouble() ?? 0.0,
    windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
    windDirection: (json['wind_direction'] as num?)?.toDouble() ?? 0.0,
    airPressure: (json['air_pressure'] as num?)?.toDouble() ?? 0.0,
    humidity: json['humidity'] as int? ?? 0,
    visibility: (json['visibility'] as num?)?.toDouble() ?? 0.0,
    predictability: json['predictability'] as int? ?? 0,
  );
}

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weather_state_name': instance.weatherStateName,
      'weather_state_abbr': instance.weatherStateAbbr,
      'wind_direction_compass': instance.windDirectionCompass,
      'created': instance.created,
      'applicable_date': instance.applicableDate,
      'min_temp': instance.minTemp,
      'max_temp': instance.maxTemp,
      'the_temp': instance.theTemp,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'air_pressure': instance.airPressure,
      'humidity': instance.humidity,
      'visibility': instance.visibility,
      'predictability': instance.predictability,
    };
