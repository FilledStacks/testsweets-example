import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/shared/ui_helpers.dart';
import 'package:example/ui/widgets/dumb_widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'media_permissions_viewmodel.dart';

class MediaPermissionsView extends StackedView<MediaPermissionsViewModel> {
  const MediaPermissionsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MediaPermissionsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcDarkGreyColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getResponsiveHorizontalSpaceMedium(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Get Deliveries wherever you are 🚗',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w800,
                  height: 0.75,
                ),
              ),
              verticalSpaceMedium,
              Text(
                'We need access to your location to provide you with the best experience.',
              ),
              verticalSpaceLarge,
              AppButton(
                title: 'Grant Permissions',
                onPressed: viewModel.requestPermission,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MediaPermissionsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MediaPermissionsViewModel();
}
