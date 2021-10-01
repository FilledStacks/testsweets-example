import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/shared/ui_helpers.dart';
import 'package:example/ui/widgets/dumb_widgets/app_button.dart';
import 'package:example/ui/widgets/dumb_widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = useTextEditingController();
    var password = useTextEditingController();

    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kcDarkGreyColor,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getResponsiveHorizontalSpaceMedium(context)),
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('Welcome to TestSweets',
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800)),
              Text('Login with your details below'),
              verticalSpaceLarge,
              SizedBox(
                child: InputField(
                  controller: email,
                  placeholder: 'Enter your Email',
                ),
              ),
              verticalSpaceSmall,
              SizedBox(
                child: InputField(
                  controller: password,
                  placeholder: 'Enter your Password',
                ),
              ),
              verticalSpaceSmall,
              if (true)
                SizedBox(
                  child: GestureDetector(
                    onTap: () => model.navigateToForgotPassword(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              verticalSpaceMedium,
              if (model.hasValidationError)
                GestureDetector(
                  onTap: () => model.navigateToForgotPassword(),
                  child: Column(
                    children: <Widget>[
                      Text(
                        model.validationMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
              SizedBox(
                child: AppButton(
                  title: 'Login',
                  busy: model.isBusy,
                  onPressed: () => model.login(
                    userName: email.text,
                    password: password.text,
                  ),
                ),
              ),
              if (true)
                Column(
                  children: <Widget>[
                    verticalSpaceMedium,
                    GestureDetector(
                        onTap: () => model.navigateToSignUp(),
                        child: Text('Don\'t have an account? Sign up'))
                  ],
                ),
            ]),
          ),
        ),
      ),
    );
  }
}
