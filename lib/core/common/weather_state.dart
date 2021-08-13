enum WeatherState {
  c,
  h,
  hc,
  hr,
  lc,
  lr,
  s,
  sl,
  sn,
  t,
  none,
}

extension WeatherStateExtension on WeatherState {
  String get pathAsset {
    return "assets/icons/icon_${this.abb}.png";
  }

  String get abb {
    switch (this) {
      case WeatherState.c:
        return "c";
      case WeatherState.h:
        return "h";
      case WeatherState.hc:
        return "hc";
      case WeatherState.hr:
        return "hr";
      case WeatherState.lc:
        return "lc";
      case WeatherState.lr:
        return "lr";
      case WeatherState.s:
        return "s";
      case WeatherState.sl:
        return "sl";
      case WeatherState.sn:
        return "sn";
      case WeatherState.t:
        return "t";
      default:
        return "";
    }
  }

  String get name {
    switch (this) {
      case WeatherState.c:
        return "Clear";
      case WeatherState.h:
        return "Hail";
      case WeatherState.hc:
        return "Heavy Cloud";
      case WeatherState.hr:
        return "Heavy Rain";
      case WeatherState.lc:
        return "Light Cloud";
      case WeatherState.lr:
        return "Light Rain";
      case WeatherState.s:
        return "Showers";
      case WeatherState.sl:
        return "Sleet";
      case WeatherState.sn:
        return "Snow";
      case WeatherState.t:
        return "Thunderstorm";
      default:
        return "";
    }
  }
}

extension WeatherStateAbbr on String {
  WeatherState getWeatherState() {
    switch (this) {
      case "c":
        return WeatherState.c;
      case "h":
        return WeatherState.h;
      case "hc":
        return WeatherState.hc;
      case "hr":
        return WeatherState.hr;
      case "lc":
        return WeatherState.lc;
      case "lr":
        return WeatherState.lr;
      case "s":
        return WeatherState.s;
      case "sl":
        return WeatherState.sl;
      case "sn":
        return WeatherState.sn;
      case "t":
        return WeatherState.t;
      default:
    }
    return WeatherState.none;
  }
}
