import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/layout/grid_layout.dart';
import 'package:infinity_edge_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KSortableProducts extends StatelessWidget {
  const KSortableProducts({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // DropDown
        DropdownButtonFormField(dropdownColor: dark ? KColors.dark : KColors.light,
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ].map((option) => DropdownMenuItem(value: option,child: Text(option)),).toList(),
        ),
        SizedBox(height: KSizes.spaceBtwSections), 
        // Products
        KGridLayout(itemCount: 7, itemBuilder: (_, index) => KProductCardVertical())
      ],
    );
  }
}