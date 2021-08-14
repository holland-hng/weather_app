import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/src/data/datasources/weather_remote_data_source.dart';
import 'package:weather_app/src/data/datasources/weather_local_data_source.dart';
import 'package:weather_app/src/data/responses/weather_builder.dart';
import 'package:weather_app/src/data/responses/weather_response.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';
import 'package:weather_app/src/domain/repositories/home_repository.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final WeatherRemoteDataSource _remoteDataSource;
  final WeatherLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final WeatherBuilder _weatherBuilder;

  HomeRepositoryImpl(this._remoteDataSource, this._networkInfo,
      this._localDataSource, this._weatherBuilder);

  @override
  Future<Result<Failure, WeatherEntity>> getWeather(DateTime date) async {
    if (await _networkInfo.isConnected) {
      try {
        //get data from remote api
        List<WeatherResponse> _weathers =
            await _remoteDataSource.getWeathers(date);
        WeatherEntity _entity = _weatherBuilder.buildEntity(_weathers);
        _localDataSource.cacheWeather(_entity);
        return Success(_entity);
      } on ServerException {
        //throw ServerFailure
        return Error(ServerFailure());
      }
    } else {
      try {
        //get data from local database
        WeatherEntity _entity = _localDataSource.getWeather(date);
        return Success(_entity);
      } on CacheException {
        //throw CacheFailure
        return Error(CacheFailure());
      }
    }
  }
}
