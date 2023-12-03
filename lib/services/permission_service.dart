import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<void> requestLocationPermissions() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
  }
}
