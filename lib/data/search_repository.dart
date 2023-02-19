import 'dart:math';
import '../utilities/network.dart';

class SearchRepository {
  Future<String> fetchData(String searchTestData) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        final random = Random();

        // Simulate some network exception
        if (random.nextBool()) {
          throw NetworkException();
        }

        // Return "fetched"
        return searchTestData;
      },
    );
  }
}
