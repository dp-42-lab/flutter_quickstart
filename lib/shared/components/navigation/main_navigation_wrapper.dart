import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_routes.dart';
import '../../../modules/home/home.page.dart';
import '../../../modules/profile/profile.page.dart';
import '../../../modules/settings/settings.page.dart';
import '../../../state/navigation/navigation.state.dart';
import '../../../state/settings/theme_manager.state.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class MainPage extends HookConsumerWidget {
  const MainPage({this.initialIndex = 0, super.key});
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: initialIndex);
    final navigationStateActions = ref.watch(navigationStateProvider.notifier);
    final navigationState = ref.watch(navigationStateProvider);

    final themeModeNotifier = ref.watch(themeManagerProvider.notifier);
    final themeMode = ref.watch(themeManagerProvider);

    final List<NavigationDestination> destinations = <NavigationDestination>[
      const NavigationDestination(label: 'Home', icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home)),
      const NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
      const NavigationDestination(label: 'Settings', selectedIcon: Icon(Icons.settings), icon: Icon(Icons.settings_outlined)),
    ];

    final List<Widget> pageOptions = [const HomePage(), const ProfilePage(), const SettingsPage()];

    useEffect(() {
      Future.microtask(() {
        if (pageController.hasClients && pageController.page?.round() != navigationState.currentPage) {
          pageController.jumpToPage(navigationState.currentPage);
        }
      });
      return null;
    }, [navigationState.currentPage]);

    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        ProfileRoute(),
        SettingsRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(context.topRoute.name),
            leading: const AutoLeadingButton(),
          ),
          body: child,
          bottomNavigationBar: NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
              NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
