part of 'menu_cubit.dart';

@immutable
abstract class PagesState {
  const PagesState();
}

class PagesInitial extends PagesState {
  const PagesInitial();
}

class PagesLoading extends PagesState {
  const PagesLoading();
}

class PagesHome extends PagesState {
  final String homeData;

  const PagesHome(this.homeData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesHome &&
          runtimeType == other.runtimeType &&
          homeData == other.homeData;

  @override
  int get hashCode => homeData.hashCode;
}

class PagesSearch extends PagesState {
  final String searchData;

  const PagesSearch(this.searchData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesSearch &&
          runtimeType == other.runtimeType &&
          searchData == other.searchData;

  @override
  int get hashCode => searchData.hashCode;
}

class PagesError extends PagesState {
  final String message;
  const PagesError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PagesError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
