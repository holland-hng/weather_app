import 'package:weather_app/src/data/responses/weather_response.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';

class WeatherBuilder {
  static WeatherEntity buildEntity(List<WeatherResponse> weathers) {
    var weather = weathers[0];
    return WeatherEntity(
      weatherStateName: weather.weatherStateName,
      weatherStateAbbr: weather.weatherStateAbbr,
      windDirectionCompass: weather.windDirectionCompass,
      created: weather.created,
      applicableDate: weather.applicableDate,
      minTemp: weather.minTemp,
      maxTemp: weather.maxTemp,
      theTemp: weather.theTemp,
      windSpeed: weather.windSpeed,
      windDirection: weather.windDirection,
      airPressure: weather.airPressure,
      humidity: weather.humidity,
      visibility: weather.visibility,
      predictability: weather.predictability,
    );
  }
}
