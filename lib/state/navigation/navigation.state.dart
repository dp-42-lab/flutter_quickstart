import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'navigation.state.model.dart';

part 'navigation.state.g.dart';

@Riverpod(keepAlive: true)
class NavigationState extends _$NavigationState {
  @override
  NavigationStateModel build() => const NavigationStateModel(currentPage: 0);

  void setPage(int index) {
    state = state.copyWith(currentPage: index);
  }
}
