import 'dart:math';
import '../utilities/network.dart';

class SearchRepository {
  Future<String> fetchData(String searchTestData) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        // Return "fetched"
        return searchTestData;
      },
    );
  }
}
