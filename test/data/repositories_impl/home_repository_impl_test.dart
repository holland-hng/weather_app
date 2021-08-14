import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:weather_app/src/data/repositories_impl/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../generate_mock_test.mocks.dart';

void main() {
  HomeRepositoryImpl? repository;
  MockWeatherRemoteDataSource? mockRemoteDataSource;
  MockWeatherLocalDataSource? mockLocalDataSource;
  MockWeatherBuilder? mockBuilder;
  MockNetworkInfo? mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockWeatherRemoteDataSource();
    mockLocalDataSource = MockWeatherLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockBuilder = MockWeatherBuilder();

    repository = HomeRepositoryImpl(mockRemoteDataSource!, mockNetworkInfo!,
        mockLocalDataSource!, mockBuilder!);
  });

  test(
    'getWeather from HomRepository',
    () async {
      final MockWeatherResponse _response = MockWeatherResponse();
      final MockWeatherEntity _entity = MockWeatherEntity();
      // arrange
      when(mockNetworkInfo?.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource?.getWeathers(any))
          .thenAnswer((_) async => [_response]);
      when(mockLocalDataSource?.getWeather(any)).thenAnswer((_) => _entity);
      when(mockBuilder?.buildEntity(any)).thenAnswer((_) => _entity);
      // act
      final result = await repository?.getWeather(DateTime.now());
      // assert
      verify(repository?.getWeather(DateTime.now()));
      expect(result, equals(Success(_entity)));
    },
  );
}
