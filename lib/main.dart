import 'package:flutter/material.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testsweets/testsweets.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

const bool DRIVE_MODE = bool.fromEnvironment(
  'DRIVE_MODE',
  defaultValue: false,
);

Future<void> main() async {
  if (DRIVE_MODE) {
    enableFlutterDriverExtension();
  }

  setupLocator();
  await setupTestSweets();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, child) => TestSweetsOverlayView(
        child: child!,
        projectId: 'gtyFrouVTyHEgX6j7gzu',
        captureWidgets: !DRIVE_MODE,
      ),
      theme: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      initialRoute: Routes.loginView,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorObservers: [
        TestSweetsNavigatorObserver.instance,
      ],
    );
  }
}
