import 'package:example/ui/shared/app_colors.dart';
import 'package:example/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

/// The button used throughout the app.
///
/// Can show a busy indicator.
/// Can be disabled.
class AppButton extends StatefulWidget {
  final bool busy;
  final String title;
  final void Function()? onPressed;
  final bool enabled;
  final Color? color;
  final Key? buttonKey;

  const AppButton({
    this.buttonKey,
    required this.title,
    required this.onPressed,
    this.busy = false,
    this.enabled = true,
    this.color,
  });

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    // We wrap the container in a Row and a Column to force it to wrap it's inner child
    // If we don't do this the button takes up the parents infinite dimension which is not what we want.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              key: widget.buttonKey,
              onTap: widget.enabled && !widget.busy ? widget.onPressed : () {},
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    horizontal: widget.busy ? 10 : 25,
                    vertical: widget.busy ? 10 : 10),
                decoration: BoxDecoration(
                  color: widget.enabled
                      ? widget.color ?? kcPrimaryColor
                      : Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: !widget.busy
                    ? Text(
                        widget.title,
                        style: ktsButtonTitleTextStyle,
                      )
                    : CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(kcPrimaryColorDark),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
