import 'package:example/services/permission_service.dart';
import 'package:example/ui/views/login/login_view.dart';
import 'package:example/ui/views/main/main_view.dart';
import 'package:example/ui/views/media_permissions/media_permissions_view.dart';
import 'package:example/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(
      page: LoginView,
      initial: true,
    ),
    MaterialRoute(page: MainView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: MediaPermissionsView)
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: PermissionService),
    // @stacked-service
  ],
  logger: StackedLogger(),
)
class App {}
