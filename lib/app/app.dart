import 'package:example/ui/views/login/login_view.dart';
import 'package:example/ui/views/main/main_view.dart';
import 'package:example/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: LoginView,
      initial: true,
    ),
    MaterialRoute(page: MainView),
    MaterialRoute(page: SignUpView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
  logger: StackedLogger(),
)
class App {}
