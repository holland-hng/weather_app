import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';

//check network available
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@Singleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    return await Connectivity().checkConnectivity() != ConnectivityResult.none;
  }
}
