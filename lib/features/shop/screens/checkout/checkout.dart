import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/coupon_widgets.dart';
import 'package:infinity_edge_app/common/widgets/success_screen/success_screen.dart';
import 'package:infinity_edge_app/features/shop/screens/cart/widgets/cart_items_reuse.dart';
import 'package:infinity_edge_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:infinity_edge_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:infinity_edge_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:infinity_edge_app/navigation_menu.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: KAppbar(
        showBackArrow: true,
        title: Text(
          "Order Review",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Items in Cart
              KCartReuseItems(showADDRemoveButtons: false),
              SizedBox(height: KSizes.spaceBtwSections),

              // Coupon TextField
              KCouponCode(),
              SizedBox(height: KSizes.spaceBtwSections),

              // Billing Section
              KRoundedContainer(
                padding: EdgeInsets.all(KSizes.md),
                showBorder: true,
                backgroundColor: dark ? KColors.black : KColors.white,
                child: Column(
                  children: [
                    // Princing
                    KBillingAmountSection(),
                    SizedBox(height: KSizes.spaceBtwItems),

                    // Divider
                    Divider(),
                    SizedBox(height: KSizes.spaceBtwItems),

                    // Payement Methods
                    KBillingPaymentSection(),
                    SizedBox(height: KSizes.spaceBtwItems),

                    // Address
                    KBillingAddressScreen(),
                    SizedBox(height: KSizes.spaceBtwItems),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreen(
              image: KImages.successfulPaymentIcon,
              title: "Payment Success",
              subtitle: "Your item will be shipped soon!",
              onPressed: () => Get.offAll(() => NavigationMenu()),
            ),
          ),
          child: Text("CheckOut \$256.0"),
        ),
      ),
    );
  }
}
