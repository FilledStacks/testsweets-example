import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'signup_viewmodel.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: model.navigateToOtherView,
          ),
        ),
      ),
      viewModelBuilder: () => SignUpViewModel(),
    );
  }
}
