import 'package:example/app/app.locator.dart';
import 'package:example/app/app.router.dart';
import 'package:example/services/permission_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MediaPermissionsViewModel extends BaseViewModel {
  final _permissionService = locator<PermissionService>();
  final _navigationService = locator<NavigationService>();

  Future<void> requestPermission() async {
    await _permissionService.requestLocationPermissions();
    await _navigationService.replaceWithMainView();
  }
}
