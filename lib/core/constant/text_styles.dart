import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'fonts.dart';

class TextStyles {
  //new textstyles
  static const TextStyle headline1 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 34,
  );
  static const TextStyle headline2 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static const TextStyle headline3 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const TextStyle headline4 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  static const TextStyle headline4White = TextStyle(
    color: AppColor.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static const TextStyle headline5 = TextStyle(
    color: AppColor.black,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle greyHeadline6 = TextStyle(
    color: AppColor.grey,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  // old textstyles
  static const TextStyle primaryMediumTextStyle = TextStyle(
    color: AppColor.black,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodyMediumFontSize,
  );
  static const TextStyle primaryTextStyle = TextStyle(
    color: AppColor.black,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodyFontSize,
  );
  static const TextStyle greyTextStyle = TextStyle(
    color: AppColor.grey,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodyFontSize,
  );
  static const TextStyle primaryTextStyleSmall = TextStyle(
    color: AppColor.black,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodySmallerFontSize,
  );

  static const TextStyle primaryTextStyle3 = TextStyle(
    color: AppColor.black,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodySmallerFontSize,
  );

  static const TextStyle greyTextStyle3 = TextStyle(
    color: AppColor.grey,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodySmallerFontSize,
  );
  static const TextStyle greyTextStyle4 = TextStyle(
    color: AppColor.grey,
    fontWeight: Fonts.bodyFontWeight,
    fontSize: Fonts.bodySmallestFontSize,
  );
}
