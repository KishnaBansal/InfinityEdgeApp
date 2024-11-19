import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/chips/choice_chip.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_price_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_title_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute pricing and description
        KRoundedContainer(
          padding: EdgeInsets.all(KSizes.md),
          backgroundColor: dark ? KColors.darkerGrey : KColors.grey,
          child: Column(
            children: [
              // Title, Price and Stock status
              Row(
                children: [
                  KSectionHeading(title: "Variation", showActionButton: false),
                  SizedBox(width: KSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          KProductTitleText(title: "Price : ", smallSize: true),
                          // Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(width: KSizes.spaceBtwItems),
                          // Sale Price
                          KProductPriceText(price: '20')
                        ],
                      ),
                      // Stock
                      Row(
                        children: [
                          KProductTitleText(title: "Stock: ", smallSize: true),
                          Text("In stock",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Variation Description
              KProductTitleText(
                title:
                    "This is description of the product and it can go upto max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwItems),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KSectionHeading(title: "Colors",showActionButton: false),
            SizedBox(height: KSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                KChoiceChip(
                    text: "Green", selected: true, onSelected: (value) {}),
                KChoiceChip(
                    text: "Blue", selected: false, onSelected: (value) {}),
                KChoiceChip(
                    text: "Yellow", selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        SizedBox(height: KSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KSectionHeading(title: "Size"),
            SizedBox(height: KSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                KChoiceChip(
                    text: "EU 34", selected: true, onSelected: (value) {}),
                KChoiceChip(
                    text: "EU 36", selected: false, onSelected: (value) {}),
                KChoiceChip(
                    text: "EU 38", selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
