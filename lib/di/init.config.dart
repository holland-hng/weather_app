// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/network/network_info.dart' as _i6;
import '../core/service/remote_service.dart' as _i7;
import '../src/data/datasources/weather_local_data_source.dart' as _i9;
import '../src/data/datasources/weather_remote_data_source.dart' as _i10;
import '../src/data/repositories_impl/home_repository_impl.dart' as _i11;
import '../src/data/responses/weather_builder.dart' as _i8;
import '../src/domain/repositories/home_repository.dart' as _i5;
import '../src/presentation/bloc/checking_network_bloc.dart' as _i3;
import '../src/presentation/bloc/home_bloc.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CheckingNetworkBloc>(() => _i3.CheckingNetworkBloc());
  gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc(get<_i5.HomeRepository>()));
  gh.singleton<_i6.NetworkInfo>(_i6.NetworkInfoImpl());
  gh.singleton<_i7.RemoteService>(_i7.RemoteService());
  gh.singleton<_i8.WeatherBuilder>(_i8.WeatherBuilder());
  gh.singleton<_i9.WeatherLocalDataSource>(_i9.WeatherLocalDataSourceImpl());
  gh.singleton<_i10.WeatherRemoteDataSource>(
      _i10.WeatherRemoteDataSourceImpl(get<_i7.RemoteService>()));
  gh.singleton<_i5.HomeRepository>(_i11.HomeRepositoryImpl(
      get<_i10.WeatherRemoteDataSource>(),
      get<_i6.NetworkInfo>(),
      get<_i9.WeatherLocalDataSource>(),
      get<_i8.WeatherBuilder>()));
  return get;
}
