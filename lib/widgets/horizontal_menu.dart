import 'package:dashboard/constants/Controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import 'Custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function()? onTap;

  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        onHover: (value) {
          value
              ? Menu_Controller.onHover(itemName)
              : Menu_Controller.onHover("not hovering");
        },
        child: Obx(() => Container(
            color: Menu_Controller.isHovering(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                visible: Menu_Controller.isHovering(itemName) ||
                    Menu_Controller.isActive(itemName),
                child: Container(
                  width: 6,
                  height: 40,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              SizedBox(width: _width / 80),
              Padding(
                padding: EdgeInsets.all(16),
                child: Menu_Controller.returnIconFor(itemName),
              ),
              if (!Menu_Controller.isActive(itemName))
                Flexible(
                    child: CustomText(
                        text: itemName,
                        color: Menu_Controller.isHovering(itemName)
                            ? dark
                            : lightGrey,
                        size: 5,
                        weight: FontWeight.normal))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  weight: FontWeight.normal,
                  color: dark,
                  size: 18,
                ))
            ]))));
  }
}
