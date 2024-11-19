import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KBottomAddToCart extends StatelessWidget {
  const KBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: KSizes.defaultSpace, vertical: KSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? KColors.darkerGrey : KColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(KSizes.cardRadiusLg),
          topRight: Radius.circular(KSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              KCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: KColors.darkGrey,
                width: 40,
                height: 40,
                color: KColors.white,
              ),
              const SizedBox(width: KSizes.spaceBtwItems),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: KSizes.spaceBtwItems),
              KCircularIcon(
                icon: Iconsax.add,
                backgroundColor: KColors.black,
                width: 40,
                height: 40,
                color: KColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Add to Cart"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(KSizes.md),
              backgroundColor: KColors.black,
              side: BorderSide(color: KColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
