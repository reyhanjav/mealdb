import 'package:flutter/material.dart';

class Sizes {
  static const double _iconspace = 4.0;
  static const double _small = 8.0;
  static const double _medium = 16.0;
  static const double _large = 32.0;
  static const double _xlarge = 64.0;
  static const double _xxlarge = 80.0;
  static const Widget verticalSpaceIcon = SizedBox(height: _iconspace);
  static const Widget verticalSpaceSmall = SizedBox(height: _small);
  static const Widget verticalSpaceMedium = SizedBox(height: _medium);
  static const Widget verticalSpaceLarge = SizedBox(height: _large);
  static const Widget verticalSpaceXLarge = SizedBox(height: _xlarge);
  static const Widget verticalSpaceXXLarge = SizedBox(height: _xxlarge);

  static const Widget horizontalSpaceIcon = SizedBox(width: _iconspace);
  static const Widget horizontalSpaceSmall = SizedBox(width: _small);
  static const Widget horizontalSpaceMedium = SizedBox(width: _medium);
  static const Widget horizontalSpaceLarge = SizedBox(width: _large);
  static const Widget horizontalSpaceXLarge = SizedBox(width: _xlarge);
  static const Widget horizontalSpaceXXLarge = SizedBox(width: _xxlarge);

  static const v1h2Edge =
      EdgeInsets.symmetric(vertical: _iconspace, horizontal: _small);
  static const v2h1Edge =
      EdgeInsets.symmetric(vertical: _small, horizontal: _iconspace);
  static const v3h2Edge =
      EdgeInsets.symmetric(vertical: _medium, horizontal: _small);
  static const v2h3Edge =
      EdgeInsets.symmetric(vertical: _small, horizontal: _medium);

  static const verticalEdgeIcon = EdgeInsets.symmetric(vertical: _iconspace);
  static const verticalEdgeSmall = EdgeInsets.symmetric(vertical: _small);
  static const verticalEdgeMedium = EdgeInsets.symmetric(vertical: _medium);
  static const verticalEdgeLarge = EdgeInsets.symmetric(vertical: _large);
  static const verticalEdgeXLarge = EdgeInsets.symmetric(vertical: _xlarge);
  static const verticalEdgeXXLarge = EdgeInsets.symmetric(vertical: _xxlarge);

  static const horizontalEdgeIcon =
      EdgeInsets.symmetric(horizontal: _iconspace);
  static const horizontalEdgeSmall = EdgeInsets.symmetric(horizontal: _small);
  static const horizontalEdgeMedium = EdgeInsets.symmetric(horizontal: _medium);
  static const horizontalEdgeLarge = EdgeInsets.symmetric(horizontal: _large);
  static const horizontalEdgeXLarge = EdgeInsets.symmetric(horizontal: _xlarge);
  static const horizontalEdgeXXLarge =
      EdgeInsets.symmetric(horizontal: _xxlarge);

  static const bothEdgeIcon = EdgeInsets.all(_iconspace);
  static const bothEdgeSmall = EdgeInsets.all(_small);
  static const bothEdgeMedium = EdgeInsets.all(_medium);
  static const bothEdgeLarge = EdgeInsets.all(_large);
  static const bothEdgeXLarge = EdgeInsets.all(_xlarge);
  static const bothEdgeXXLarge = EdgeInsets.all(_xxlarge);
}
