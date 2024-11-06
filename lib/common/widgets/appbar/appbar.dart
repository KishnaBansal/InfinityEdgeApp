import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/device/device_utility.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KAppbar extends StatelessWidget implements PreferredSizeWidget {
  const KAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    bool dark = KHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: dark ? Icon(Iconsax.arrow_left,color: KColors.white,) : Icon(Iconsax.arrow_left,color: KColors.black),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
}




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:infinity_edge_app/utils/constants/colors.dart';
// import 'package:infinity_edge_app/utils/constants/sizes.dart';
// import 'package:infinity_edge_app/utils/device/device_utility.dart';

// class KAppbar extends StatelessWidget implements PreferredSizeWidget {
//   const KAppbar({
//     super.key,
//     this.title,
//     this.showBackArrow = true,
//     this.leadingIcon,
//     this.actions,
//     this.leadingOnPressed,
//   });

//   final Widget? title;
//   final bool showBackArrow;
//   final IconData? leadingIcon;
//   final List<Widget>? actions;
//   final VoidCallback? leadingOnPressed;

//   @override
//   Widget build(BuildContext context) {
//     // Check if there's a previous page using ModalRoute
//     final canGoBack = ModalRoute.of(context)?.canPop ?? false;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: KSizes.md),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Show back arrow if `canGoBack` is true, or if `showBackArrow` is true
//           (canGoBack || showBackArrow)
//               ? IconButton(
//                   onPressed: leadingOnPressed ?? () => Get.back(),
//                   icon: const Icon(Iconsax.arrow_left),
//                 )
//               : leadingIcon != null
//                   ? IconButton(
//                       onPressed: leadingOnPressed,
//                       icon: Icon(leadingIcon),
//                     )
//                   : const SizedBox.shrink(),
//           // Title
//           if (title != null) Expanded(child: Center(child: title)),
//           // Actions
//           if (actions != null) Row(children: actions!),
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(KDeviceUtils.getAppBarHeight());
// }
