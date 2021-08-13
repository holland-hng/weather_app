import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoteService {
  late Dio _dio;
  RemoteService() {
    var options = BaseOptions(
      baseUrl: 'https://www.metaweather.com/api/',
      connectTimeout: 15000,
      receiveTimeout: 5000,
    );
    _dio = Dio(options);
  }

  Dio get dio {
    return _dio;
  }

  void setToken(String token) {
    //set token for dio
  }
}
