import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        title: Text("Sports shirts"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              KRoundedImage(
                width: double.infinity,
                imageUrl: KImages.banner3,
                applyImageRadius: true,
              ),
              SizedBox(height: KSizes.spaceBtwSections),

              // Sub categories
              Column(
                children: [
                  // Heading
                  KSectionHeading(title: "Sports Shirts", onPressed: () {}),
                  SizedBox(height: KSizes.spaceBtwSections / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (context, index) => SizedBox(width: KSizes.spaceBtwItems),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) => KProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
