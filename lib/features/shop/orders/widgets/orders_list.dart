import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KOrderListItems extends StatelessWidget {
  const KOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 6,
      separatorBuilder: (_,__) => SizedBox(height: KSizes.spaceBtwItems),
      itemBuilder:(_, index) =>  KRoundedContainer(
        padding: EdgeInsets.all(KSizes.md),
        showBorder: true,
        backgroundColor: dark ? KColors.dark : KColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // Row 1
          children: [
            Row(
              children: [
                // Icon
                Icon(Iconsax.ship),
                SizedBox(width: KSizes.spaceBtwItems / 2),
      
                // Status and Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: KColors.primary,
                              fontWeightDelta: 1,
                            ),
                      ),
                      Text("20 Nov 2024",
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                // Icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.arrow_right_34,
                    size: KSizes.iconSm,
                  ),
                ),
              ],
            ),
            SizedBox(height: KSizes.spaceBtwItems),
      
            // Row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      Icon(Iconsax.ship),
                      SizedBox(width: KSizes.spaceBtwItems / 2),
                  
                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order", style: Theme.of(context).textTheme.labelMedium),
                            Text('[#256f2]',style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      // Icon
                      Icon(Iconsax.calendar),
                      SizedBox(width: KSizes.spaceBtwItems / 2),
                  
                      // Status and Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date", style: Theme.of(context).textTheme.labelMedium),
                            Text("25 Nov 2024",style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
              ],
            ),
          ],
        ),
      ),
    );
  }
}
