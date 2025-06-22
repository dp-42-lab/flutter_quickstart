import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../shared/components/layout/general_layout.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      headerContent: Text('Settings'),
      content: Container(color: Colors.blue),
    );
  }
}
