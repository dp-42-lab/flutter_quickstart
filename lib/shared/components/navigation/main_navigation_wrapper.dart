import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../modules/home/home.page.dart';
import '../../../modules/profile/profile.page.dart';
import '../../../modules/settings/settings.page.dart';
import '../../../state/settings/theme_manager.state.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class MainPage extends HookConsumerWidget {
  const MainPage({this.initialIndex = 0, super.key});
  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider.notifier).state;
    final pageController = usePageController(initialPage: initialIndex);

    final themeModeNotifier = ref.watch(themeManagerProvider.notifier);
    final themeMode = ref.watch(themeManagerProvider);

    final List<NavigationDestination> destinations = <NavigationDestination>[
      const NavigationDestination(label: 'Home', icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home)),
      const NavigationDestination(label: 'Profile', icon: Icon(Icons.person)),
      const NavigationDestination(label: 'Settings', selectedIcon: Icon(Icons.settings), icon: Icon(Icons.settings_outlined)),
    ];

    final List<Widget> pageOptions = [const HomePage(), const ProfilePage(), const SettingsPage()];

    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        actions: const [
          CircleAvatar(child: Text('FQ')),
          SizedBox(width: 16),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      extendBody: true,
      floatingActionButton: FloatingActionButton(onPressed: () {}, shape: const CircleBorder(), child: const Icon(Icons.add)),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: pageOptions,
          onPageChanged: (index) {
            ref.watch(selectedIndexProvider.notifier).state = index;
          },
        ), // Der dynamische Inhalt der Seite wird hier eingefügt
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 3.0,
        destinations: destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          ref.watch(selectedIndexProvider.notifier).state = index;
          pageController.jumpToPage(index);
        },
      ),
    );
  }
}
