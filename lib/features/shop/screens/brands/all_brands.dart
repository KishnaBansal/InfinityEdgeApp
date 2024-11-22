import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/brands/brand_card.dart';
import 'package:infinity_edge_app/common/widgets/layout/grid_layout.dart';
import 'package:infinity_edge_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/features/shop/screens/brands/brand_products.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        title: Text("All Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Heading
              KSectionHeading(title: "Brands", showActionButton: false),
              SizedBox(height: KSizes.spaceBtwItems),

              // Brands
              KGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => KBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => BrandProducts(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
