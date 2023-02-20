part of 'menu_cubit.dart';

@immutable
abstract class MenuState {
  const MenuState();
}

class MenuInitial extends MenuState {
  const MenuInitial();
}

class MenuLoading extends MenuState {
  const MenuLoading();
}

class MenuHome extends MenuState {
  final String homeData;

  const MenuHome(this.homeData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuHome &&
          runtimeType == other.runtimeType &&
          homeData == other.homeData;

  @override
  int get hashCode => homeData.hashCode;
}

class MenuSearch extends MenuState {
  final String searchData;

  const MenuSearch(this.searchData);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuSearch &&
          runtimeType == other.runtimeType &&
          searchData == other.searchData;

  @override
  int get hashCode => searchData.hashCode;
}

class MenuSettings extends MenuState {
  final UserModel user;

  const MenuSettings(this.user);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuSettings &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MenuError &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}
