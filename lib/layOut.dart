import 'package:dashboard/helpers/resposiveness.dart';
import 'package:dashboard/widgets/customScreen.dart';
import 'package:dashboard/widgets/large_screen.dart';
import 'package:dashboard/widgets/mediumScreen.dart';
import 'package:dashboard/widgets/small_screen.dart';
import 'package:dashboard/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class Sitelayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        appBar: topNavigationbar(context, scaffoldkey),
        drawer: Drawer(),
        body: ResponsiveWidget(
          largeScreen: LargeScreen(),
          smallScreen: SmallScreen(),
          mediumScreen: MediumScreen(),
          customScreen: CustomScreen(),
        ));
  }
}
