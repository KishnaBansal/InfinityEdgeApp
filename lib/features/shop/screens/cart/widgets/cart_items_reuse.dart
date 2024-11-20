import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/add_remove_button.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/cart_item.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_price_text.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KCartReuseItems extends StatelessWidget {
  const KCartReuseItems({
    super.key, this.showADDRemoveButtons = true,
  });

  final bool showADDRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: KSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          KCartItem(),
          if(showADDRemoveButtons) SizedBox(height: KSizes.spaceBtwItems),
          if(showADDRemoveButtons)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Extra Space
                    SizedBox(width: 70),
                    // Add Remove items
                    KProductQuantityAddRemove(),
                  ],
                ),
                KProductPriceText(price: "256"),
              ],
            ),
        ],
      ),
    );
  }
}
