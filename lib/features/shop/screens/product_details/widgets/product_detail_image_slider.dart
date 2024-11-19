import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KProductImageSlider extends StatelessWidget {
  const KProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return KCurvedEdgeWidget(
      child: Container(
        color: dark ? KColors.darkerGrey : KColors.light,
        child: Stack(
          children: [
            // Main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding:
                    const EdgeInsets.all(KSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(KImages.productImage5),
                  ),
                ),
              ),
            ),
    
            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: KSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 7,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      SizedBox(width: KSizes.spaceBtwItems),
                  itemBuilder: (_, index) => KRoundedImage(
                    width: 80,
                    imageUrl: KImages.productImage3,
                    backgroundColor:
                        dark ? KColors.dark : KColors.light,
                    border: Border.all(color: KColors.primary),
                    padding: EdgeInsets.all(KSizes.sm),
                  ),
                ),
              ),
            ),
    
            // AppBar Icons
            KAppbar(
              showBackArrow: true,
              actions: [
                KCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}