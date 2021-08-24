import 'package:dashboard/constants/Controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/resposiveness.dart';
import 'package:dashboard/routing/routes,dart.dart';
import 'package:dashboard/widgets/Custom_text.dart';
import 'package:dashboard/widgets/side_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(children: [
        if (ResponsiveWidget.isSmallScreen(context))
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(children: [
                SizedBox(width: _width / 48),
                Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/logo.png")),
                Flexible(
                    child: CustomText(
                        text: "Dash",
                        color: active,
                        size: 20,
                        weight: FontWeight.bold)),
                SizedBox(
                  width: _width / 48,
                )
              ])
            ],
          ),
        SizedBox(
          height: 40,
        ),
        Divider(color: lightGrey.withOpacity(.1)),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: sideMenuItems
              .map((itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? 'Log Out'
                        : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        //TODO:: go to authentication page
                      }
                      if (!Menu_Controller.isActive(itemName)) {
                        Menu_Controller.changeActiveItemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                      }
                    },
                  ))
              .toList(),
        )
      ]),
    );
  }
}
