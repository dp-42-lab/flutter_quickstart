import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quickstart/shared/theme/theme.dart';
import 'package:flutter_quickstart/shared/theme/util.dart';
import 'package:flutter_quickstart/state/settings/theme_manager.state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'core/router/app_routes.dart';

final appRouter = AppRouter();

void main() {
  LicenseRegistry.addLicense(() async* {
    LicenseRegistry.addLicense(() async* {
      final notoSansLicense = await rootBundle.loadString('fonts/NOTO_OFL.txt');
      yield LicenseEntryWithLineBreaks(['fonts/Noto Sans'], notoSansLicense);

      final cardoLicense = await rootBundle.loadString('fonts/CARDO_OFL.txt');
      yield LicenseEntryWithLineBreaks(['fonts/Cardo'], cardoLicense);
    });
  });

  runApp(const ProviderScope(child: SafeArea(child: ToastificationWrapper(child: App()))));
}

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final themeMode = ref.watch(themeManagerProvider);

    final TextTheme textTheme = createTextTheme(context, 'Noto Sans', 'Noto Sans');
    final MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dont Panic!',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: themeMode,
      routerConfig: appRouter.config(),
    );
  }
}
