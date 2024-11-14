import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/brands/brand_card.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KBrandShowCase extends StatelessWidget {
  const KBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return KRoundedContainer(
      showBorder: true,
      borderColor: KColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(KSizes.md),
      margin: EdgeInsets.only(bottom: KSizes.spaceBtwItems),
      child: Column(
        //Brands with Products Count
        children: [
          KBrandCard(showBorder: false),
          const SizedBox(height: KSizes.spaceBtwItems),

          //Brand top 3 products
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList()
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Expanded(
      child: KRoundedContainer(
        height: 100,
        padding: EdgeInsets.all(KSizes.md),
        margin: EdgeInsets.only(right: KSizes.sm),
        backgroundColor: dark ? KColors.darkerGrey : KColors.light,
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}