import 'package:flutter/material.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/device/device_utility.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KTabBar extends StatelessWidget implements PreferredSizeWidget {
  const KTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? KColors.black : KColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: KColors.primary,
        labelColor: dark ? KColors.white : KColors.black,
        unselectedLabelColor: KColors.darkerGrey,
        tabs: tabs
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}
