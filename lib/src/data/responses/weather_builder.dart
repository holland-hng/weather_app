import 'package:injectable/injectable.dart';
import 'package:weather_app/core/common/weather_state.dart';
import 'package:weather_app/src/data/responses/weather_response.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';

// build list WeatherResponse -> WeatherEntity
@singleton
class WeatherBuilder {
  WeatherEntity buildEntity(List<WeatherResponse> weathers) {
    Map<String, int> _couts = Map<String, int>();
    double _totalTemp = 0;
    double _totalHumidity = 0;
    double _totalPredictability = 0;

    //calculate totalTemp - totalHumidity - totalPredictability
    for (int i = 0; i < weathers.length; i++) {
      var _weather = weathers[i];
      _totalTemp += _weather.theTemp;
      _totalHumidity += _weather.humidity;
      _totalPredictability += _weather.predictability;
      _couts[_weather.weatherStateAbbr] =
          (_couts[_weather.weatherStateAbbr] ?? 0) + 1;
    }
    var weather = weathers[0];
    int _max = 0;
    String _abbr = "";
    _couts.forEach((key, value) {
      if (value > _max) {
        _max = value;
        _abbr = key;
      }
    });
    return WeatherEntity(
      weatherStateName: _abbr.getWeatherState().name,
      weatherStateAbbr: _abbr,
      windDirectionCompass: weather.windDirectionCompass,
      created: weather.created,
      applicableDate: weather.applicableDate,
      minTemp: weather.minTemp,
      maxTemp: weather.maxTemp,
      theTemp: _totalTemp / weathers.length,
      windSpeed: weather.windSpeed,
      windDirection: weather.windDirection,
      airPressure: weather.airPressure,
      humidity: (_totalHumidity / weathers.length).round(),
      visibility: weather.visibility,
      predictability: (_totalPredictability / weathers.length).round(),
    );
  }
}
