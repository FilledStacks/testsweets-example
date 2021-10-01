import 'package:example/ui/shared/shared_styles.dart';
import 'package:example/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'note_text.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function(String)? onChanged;
  final TextInputFormatter? formatter;
  final bool darkTheme;
  final Key? inputFieldKey;
  final Key? validationMessageKey;
  final Key? additionalNoteKey;

  InputField({
    required this.controller,
    required this.placeholder,
    this.inputFieldKey,
    this.validationMessageKey,
    this.additionalNoteKey,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.formatter,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = false,
    this.darkTheme = true,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: widget.isReadOnly ? 0.3 : 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: widget.smallVersion ? 40 : fieldHeight,
            alignment: Alignment.centerLeft,
            padding: fieldPadding,
            decoration: widget.darkTheme
                ? kdbFieldDecortaionDark
                : kdbFieldDecortaionLight,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    key: widget.inputFieldKey,
                    controller: widget.controller,
                    keyboardType: widget.textInputType,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    onChanged: widget.onChanged,
                    inputFormatters:
                        widget.formatter != null ? [widget.formatter!] : null,
                    onEditingComplete: () {
                      if (widget.enterPressed != null) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        widget.enterPressed!();
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (widget.nextFocusNode != null) {
                        widget.nextFocusNode!.requestFocus();
                      }
                    },
                    obscureText: isPassword,
                    readOnly: widget.isReadOnly,
                    decoration: InputDecoration.collapsed(
                        hintText: widget.placeholder,
                        hintStyle: TextStyle(
                            color:
                                widget.darkTheme ? Colors.white : Colors.black,
                            fontSize: widget.smallVersion ? 12 : 15)),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isPassword = !isPassword;
                  }),
                  child: widget.password
                      ? Container(
                          width: fieldHeight,
                          height: fieldHeight,
                          alignment: Alignment.center,
                          child: Icon(isPassword
                              ? Icons.visibility
                              : Icons.visibility_off))
                      : Container(),
                ),
              ],
            ),
          ),
          if (widget.validationMessage != null)
            NoteText(
              widget.validationMessage!,
              buttonKey: widget.validationMessageKey,
              color: Colors.red,
            ),
          if (widget.additionalNote != null) verticalSpace(5),
          if (widget.additionalNote != null)
            NoteText(
              widget.additionalNote!,
              buttonKey: widget.additionalNoteKey,
            ),
          verticalSpaceSmall
        ],
      ),
    );
  }
}
