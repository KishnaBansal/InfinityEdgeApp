import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/device/device_utility.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KSearchContainer extends StatelessWidget {
  const KSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal_1,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSizes.defaultSpace),
        child: Container(
          width: KDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(KSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? KColors.dark
                    : KColors.light
                : Colors.transparent,
            borderRadius:
                showBorder ? BorderRadius.circular(KSizes.cardRadiusLg) : null,
            border: Border.all(color: KColors.grey),
          ),
          child: Row(
            children: [
              Icon(icon, color: KColors.darkerGrey),
              const SizedBox(width: KSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: KColors.darkGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
