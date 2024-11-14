import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/brands/brand_show_case.dart';
import 'package:infinity_edge_app/common/widgets/layout/grid_layout.dart';
import 'package:infinity_edge_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KCategoryTab extends StatelessWidget {
  const KCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          children: [
            //Brands
            KBrandShowCase(
              images: [
                KImages.productImage1,
                KImages.productImage2,
                KImages.productImage3
              ],
            ),
            SizedBox(height: KSizes.spaceBtwItems),
      
            //Products
            KSectionHeading(title: "You might like",onPressed: () {},),
            SizedBox(height: KSizes.spaceBtwItems),
      
            KGridLayout(itemCount: 4, itemBuilder: (_, index) => KProductCardVertical(),),
            SizedBox(height: KSizes.spaceBtwSections),
          ],
        ),
      ),],
    );
  }
}
