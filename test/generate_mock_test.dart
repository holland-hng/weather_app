import 'package:mockito/annotations.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/src/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/src/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/src/data/responses/weather_builder.dart';
import 'package:weather_app/src/data/responses/weather_response.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';
import 'package:weather_app/src/domain/repositories/home_repository.dart';

@GenerateMocks([
  WeatherRemoteDataSource,
  WeatherLocalDataSource,
  NetworkInfo,
  WeatherResponse,
  WeatherEntity,
  WeatherBuilder,
  HomeRepository,
])
void main() {}
