
class NavigationStateModel{
  final int currentPage;

  const NavigationStateModel({this.currentPage = 0});

  NavigationStateModel copyWith({
    int? currentPage,
  }) {
    return NavigationStateModel(
      currentPage: currentPage ?? this.currentPage,

    );
  }
}