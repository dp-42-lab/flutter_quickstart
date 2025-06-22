import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/components/layout/general_layout.dart';

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppLayout(
      headerContent: Text('Home'),
      content: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
