import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/styles/shadows.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/common/widgets/texts/brand_verified_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_price_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_title_text.dart';
import 'package:infinity_edge_app/features/shop/screens/product_details/product_detail.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KProductCardVertical extends StatelessWidget {
  const KProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    //Container with side paddings, color, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [KShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(KSizes.productImageRadius),
          color: dark ? KColors.darkGrey : KColors.white,
        ),
        child: Column(
          children: [
            //Thubmnail, Wishlist button, discount button
            KRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(KSizes.sm),
              backgroundColor: dark ? KColors.dark : KColors.light,
              child: Stack(
                children: [
                  //Thumbnail Image
                  KRoundedImage(
                    imageUrl: KImages.productImage1,
                    applyImageRadius: true,
                  ),
                  //Sale Tag
                  Positioned(
                    top: 9,
                    child: KRoundedContainer(
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
                  ),
                  //Favourite Icon button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: KCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            //Details
            Padding(
              padding: EdgeInsets.only(left: KSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KProductTitleText(
                    title: "Green Nike Air Shoes",
                    smallSize: true,
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems / 2),
                  KBrandTitleWithVerifiedIcon(title: "Nike"),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                Padding(
                  padding: const EdgeInsets.only(left: KSizes.sm),
                  child: KProductPriceText(price: "35.0"),
                ),
      
                Container(
                  decoration: BoxDecoration(
                    color: KColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(KSizes.cardRadiusMd),
                      bottomRight: Radius.circular(KSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: KSizes.iconLg * 1.2,
                    height: KSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: KColors.white,
                      ),
                    ),
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


