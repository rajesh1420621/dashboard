import 'package:dashboard/constants/Controllers.dart';
import 'package:dashboard/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class VerticalMenuItems extends StatelessWidget {
  final String itemName;
  final Function() onTap;

  const VerticalMenuItems(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  width: 3,
                  height: 72,
                  color: dark,
                ),
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                      padding: EdgeInsets.all(16),
                      child: Menu_Controller.returnIconFor(
                        itemName,
                      ))
                ],
              ))
            ]))));
  }
}
