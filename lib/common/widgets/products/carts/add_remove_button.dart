import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KProductQuantityAddRemove extends StatelessWidget {
  const KProductQuantityAddRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        KCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: KSizes.md,
          color: dark ? KColors.white : KColors.black,
          backgroundColor:
              dark ? KColors.darkerGrey : KColors.light,
        ),
        SizedBox(width: KSizes.spaceBtwItems),
        Text("2",
            style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: KSizes.spaceBtwItems),
        KCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: KSizes.md,
          color: KColors.white,
          backgroundColor: KColors.primary,
        ),
      ],
    );
  }
}