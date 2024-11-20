import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/common/widgets/texts/brand_verified_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/product_title_text.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KCartItem extends StatelessWidget {
  const KCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        KRoundedImage(
          imageUrl: KImages.productImage1,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(KSizes.sm),
          backgroundColor:
              dark ? KColors.darkerGrey : KColors.light,
        ),
        SizedBox(width: KSizes.spaceBtwItems),
    
        // Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KBrandTitleWithVerifiedIcon(title: "Nike"),
              Flexible(
                child: KProductTitleText(
                  title: "Green Sport Shoes",
                  maxLines: 1,
                ),
              ),
              // Atributes
              Text.rich(TextSpan(children: [
                TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(text: "Size ",style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: "UK 09 ",style: Theme.of(context).textTheme.bodyLarge),
              ],),),
            ],
          ),
        ),
      ],
    );
  }
}