import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/common/widgets/layout/grid_layout.dart';
import 'package:infinity_edge_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:infinity_edge_app/features/shop/screens/home/home.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        title: Text(
          "WishList",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          KCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(children: [
            KGridLayout(itemCount: 7, itemBuilder: (_,index) => KProductCardVertical())
          ],),
        ),
      ),
    );
  }
}
