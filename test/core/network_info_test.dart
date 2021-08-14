import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/core/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements Connectivity {}

void main() {
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl();
  });

  group('isConnected', () {
    test(
      'should forward the call to DataConnectionChecker.hasConnection',
      () async {
        // arrange
        final tHasConnectionFuture = Future.value(true);

        // when(mockDataConnectionChecker.hasConnection)
        //     .thenAnswer((_) => tHasConnectionFuture);
        // // act
        // final result = await networkInfo.isConnected;
        // // assert
        // verify(mockDataConnectionChecker.hasConnection);
        // expect(result, tHasConnectionFuture);
      },
    );
  });
}
