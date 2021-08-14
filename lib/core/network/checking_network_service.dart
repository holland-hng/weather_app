import 'package:weather_app/core/widgets/network_status_popup.dart';
import 'package:weather_app/di/init.dart';
import 'package:weather_app/src/domain/events/network_event.dart';
import 'package:weather_app/src/presentation/bloc/checking_network_bloc.dart';

class CheckingNetworkService {
  static CheckingNetworkBloc _checkingNetworkBloc = getIt();
  static void init() {
    _checkingNetworkBloc.add(StartCheckingNetworkStatusEvent());
    _checkingNetworkBloc.stream.listen((network) {
      if (network.isAvailable == true) {
        NetworkStatusPopup.hide();
      } else if (network.isAvailable == false) {
        NetworkStatusPopup.show();
      }
    });
  }
}
