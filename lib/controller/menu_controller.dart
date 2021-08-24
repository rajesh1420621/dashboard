import 'package:dashboard/constants/style.dart';
import 'package:dashboard/routing/routes,dart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItems = OverViewPageRoute.obs;
  var hoveredItems = "".obs;

  changeActiveItemTo(String itemName) {
    activeItems.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoveredItems.value = itemName;
  }

  isActive(String itemName) {
    hoveredItems.value = itemName;
  }

  isHovering(String itemName) {
    hoveredItems.value = itemName;
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);
      case DriversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);
      case ClientsPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case AuthenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: dark,
      );

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
