import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quickstart/shared/theme/color.utils.dart';

import '../../core/router/app_routes.dart';
import '../../shared/theme/typography.utils.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    Future.delayed(const Duration(seconds: 0), () {
      if (context.mounted) context.router.replace(MainRoute());
    });

    return Scaffold(
      body: Material(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Don't", style: AppTextStyle.decorativeTextBold(fontSize: 50).copyWith(color: context.onSecondary)),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('Panic', style: AppTextStyle.decorativeTextBold(fontSize: 50).copyWith(color: context.onSecondary)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: CircularProgressIndicator(color: context.onSecondary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
