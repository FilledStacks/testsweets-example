import 'package:flutter/material.dart';

import 'app_colors.dart';

// Box Decorations

BoxDecoration kdbFieldDecortaionLight = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration kdbFieldDecortaionDark =
    BoxDecoration(borderRadius: BorderRadius.circular(5), color: kcMediumGrey);

// Text Styles

const TextStyle ktsButtonTitleTextStyle =
    const TextStyle(fontWeight: FontWeight.w700, color: kcPrimaryColorDark);

const TextStyle ktsDarkGreyTextStyle = const TextStyle(color: kcDarkGreyColor);
const TextStyle ktsBoldTextStyle = const TextStyle(fontWeight: FontWeight.bold);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);
