import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/add_remove_button.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/cart_item.dart';
import 'package:infinity_edge_app/common/widgets/texts/brand_verified_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_price_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_title_text.dart';
import 'package:infinity_edge_app/features/shop/screens/cart/widgets/cart_items_reuse.dart';
import 'package:infinity_edge_app/features/shop/screens/checkout/checkout.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: KAppbar(
        showBackArrow: true,
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(KSizes.defaultSpace),
        child: KCartReuseItems(showADDRemoveButtons: true),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => CheckoutScreen()),
          child: Text("CheckOut \$256.0"),
        ),
      ),
    );
  }
}


