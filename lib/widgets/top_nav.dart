import 'package:dashboard/constants/style.dart';
import 'package:dashboard/helpers/resposiveness.dart';
import 'package:flutter/material.dart';

import 'Custom_text.dart';

AppBar topNavigationbar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: Icon(Icons.dashboard_customize_outlined),
                )
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
        children: [
          Visibility(
            child: CustomText(
              text: 'Dashboard',
              color: Colors.black12,
              weight: FontWeight.bold,
              size: 20,
            ),
          ),
          Expanded(child: Container()),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
            onPressed: () {},
          ),
          Stack(children: [
            IconButton(
              icon: Icon(Icons.notifications, color: dark.withOpacity(.7)),
              onPressed: () {},
            ),
            Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: light, width: 2),
                  ),
                ))
          ]),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          SizedBox(
            width: 24,
          ),
          CustomText(
              color: lightGrey,
              text: "Panigrahi",
              size: 20,
              weight: FontWeight.normal),
          SizedBox(
            width: 16,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(Icons.person_outline, color: dark),
                  )))
        ],
      ),
      iconTheme: IconThemeData(color: dark),
      backgroundColor: Colors.transparent,
    );
