import 'package:email_validator/email_validator.dart';
import 'package:example/app/app.locator.dart';
import 'package:example/app/app.logger.dart';
import 'package:example/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  var log = getLogger('LoginViewModel');

  final NavigationService _navigationService = locator<NavigationService>();

  String? _validationMessage;

  final bool performEmailValidationOnUserName;

  LoginViewModel({
    this.performEmailValidationOnUserName = true,
  });

  String get validationMessage => _validationMessage ?? '';

  bool get hasValidationError => _validationMessage != null;

  Future login({
    required String userName,
    required String password,
  }) async {
    if (!_validateDetails(userName, password)) return;

    await runBusyFuture(Future.delayed(const Duration(seconds: 3)));

    await _navigationService.replaceWithMediaPermissionsView();
  }

  bool _validateDetails(String userName, String passoword) {
    if (performEmailValidationOnUserName &&
        !EmailValidator.validate(userName)) {
      _validationMessage = 'Please enter a valid email address to continue';
      notifyListeners();
      return false;
    }

    if (passoword.length < 6) {
      _validationMessage =
          'Please enter a password that\'s 6 characters or longer';
      notifyListeners();
      return false;
    }

    _validationMessage = null;
    notifyListeners();
    return true;
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void navigateToForgotPassword() {
    // _navigationService.navigateTo();
  }
}
