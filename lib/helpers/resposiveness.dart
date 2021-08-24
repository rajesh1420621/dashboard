import 'package:flutter/material.dart';

// Break Points for different screens;
const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customScreenSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  //class properties declared
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget customScreen;

  ResponsiveWidget(
      {Key? key,
      required this.largeScreen,
      required this.mediumScreen,
      required this.smallScreen,
      required this.customScreen})
      : super(key: key);

// static method is created to know whether the window is small large etc.
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < mediumScreenSize;

  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= smallScreenSize;

  static bool isCustomScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width >= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largeScreenSize) {
        return largeScreen;
      } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
