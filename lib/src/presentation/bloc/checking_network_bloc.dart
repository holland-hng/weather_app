import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/src/domain/events/network_event.dart';

class NetworkState {
  final bool? isAvailable;

  NetworkState({this.isAvailable});
  NetworkState copyWith({
    bool? isAvailable,
  }) {
    return NetworkState(
      isAvailable: isAvailable,
    );
  }
}

@injectable
class CheckingNetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  CheckingNetworkBloc() : super(NetworkState(isAvailable: null));

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    switch (event.type) {
      case NetworkEventType.startChecking:
        _handleStartCheckingNetworkStatus();
        break;
      case NetworkEventType.available:
        yield _handleNetworkAvailable();
        break;
      case NetworkEventType.unavailable:
        yield _handleNetworkUnavaiable();
        break;
      default:
    }
  }

  NetworkState _handleNetworkAvailable() {
    return state.copyWith(isAvailable: true);
  }

  NetworkState _handleNetworkUnavaiable() {
    return state.copyWith(isAvailable: false);
  }

  Future<void> _handleStartCheckingNetworkStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      this.add(NetworkUnavailableEvent());
    } else {
      //do nothing
    }
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print("debug $result");
      if (result == ConnectivityResult.none) {
        this.add(NetworkUnavailableEvent());
      } else {
        this.add(NetworkAvailableEvent());
      }
    });
  }
}
