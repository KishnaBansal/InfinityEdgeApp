import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/brands/brand_card.dart';
import 'package:infinity_edge_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // Brand Detail
              KBrandCard(showBorder: true),
              SizedBox(height: KSizes.spaceBtwSections),

              KSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
