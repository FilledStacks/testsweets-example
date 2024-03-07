import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testsweets/testsweets.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'services/analytics_service.dart';

Future<void> main() async {
  await setupTestSweets();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      builder: (context, child) => TestSweetsOverlayView(
        child: child!,
        projectId: 'hBPApL0mJHTofHNRipeq',
      ),
      navigatorObservers: [
        TestSweetsNavigatorObserver(),
        AnalyticsNavigatorObserver(),
      ],
      initialRoute: Routes.loginView,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
