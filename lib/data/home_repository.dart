class HomeRepository {
  Future<String> fetchData(String homeTestData) async {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        // Return "fetched"
        return homeTestData;
      },
    );
  }
}
