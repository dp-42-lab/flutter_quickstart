import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget content;
  final Widget headerContent;

  const AppLayout({super.key, required this.content, required this.headerContent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: content,
      ), // Der dynamische Inhalt der Seite wird hier eingefügt
    );
  }
}
