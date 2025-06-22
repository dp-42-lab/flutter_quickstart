import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigation.state.model.dart';

final navigationStateProvider = StateNotifierProvider<NavigationState, NavigationStateModel>((ref) => NavigationState(ref));

class NavigationState extends StateNotifier<NavigationStateModel> {
  final Ref ref;
  NavigationState(this.ref) : super(const NavigationStateModel(currentPage: 0));
}
