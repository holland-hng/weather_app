enum NetworkEventType {
  startChecking,
  available,
  unavailable,
}

class NetworkEvent {
  final NetworkEventType type;

  NetworkEvent(this.type);
}

class StartCheckingNetworkStatusEvent extends NetworkEvent {
  StartCheckingNetworkStatusEvent() : super(NetworkEventType.startChecking);
}

class NetworkAvailableEvent extends NetworkEvent {
  NetworkAvailableEvent() : super(NetworkEventType.available);
}

class NetworkUnavailableEvent extends NetworkEvent {
  NetworkUnavailableEvent() : super(NetworkEventType.unavailable);
}
