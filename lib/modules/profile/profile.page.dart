import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../shared/components/layout/general_layout.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      headerContent: const Text('Profile'),
      content: Container(color: Colors.indigo),
    );
  }
}
