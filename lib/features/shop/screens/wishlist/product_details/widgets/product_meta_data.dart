import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/images/circular_image.dart';
import 'package:infinity_edge_app/common/widgets/texts/brand_verified_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_price_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_title_text.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/enums.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KProductMetaData extends StatelessWidget {
  const KProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price and Sale Price
        Row(
          children: [
            // Sale Tag
            KRoundedContainer(
              radius: KSizes.sm,
              backgroundColor: KColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: KSizes.sm, vertical: KSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: KColors.black),
              ),
            ),
            const SizedBox(width: KSizes.spaceBtwItems),

            // Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: KSizes.spaceBtwItems),
            KProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),
        // Title
        KProductTitleText(title: "Green Nike Sports Shirt"),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

        // Stock status
        Row(
          children: [
            KProductTitleText(title: "Status"),
            const SizedBox(width: KSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems / 1.5),

        // Brand
        Row(
          children: [
            KCircularImage(
              image: KImages.shoeIcon,
              height: 32,
              width: 32,
              overlayColor: dark ? KColors.white : KColors.black,
            ),
            KBrandTitleWithVerifiedIcon(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
