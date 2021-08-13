import 'package:injectable/injectable.dart';
import 'package:weather_app/core/error/exceptions.dart';
import 'package:weather_app/core/error/failures.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/core/network/network_info.dart';
import 'package:weather_app/src/data/datasources/wather_remote_data_source.dart';
import 'package:weather_app/src/data/responses/weather_builder.dart';
import 'package:weather_app/src/data/responses/weather_response.dart';
import 'package:weather_app/src/domain/entities/weather_entity.dart';
import 'package:weather_app/src/domain/repositories/home_repository.dart';

@Singleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final WeatherRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Result<Failure, WeatherEntity>> getWeather(DateTime date) async {
    if (await _networkInfo.isConnected) {
      try {
        List<WeatherResponse> _weathers =
            await _remoteDataSource.getWeathers(date);
        WeatherEntity _entity = WeatherBuilder.buildEntity(_weathers);
        return Success(_entity);
      } on ServerException {
        return Error(ServerFailure());
      }
    } else {
      return Error(ServerFailure());
    }
  }
}
