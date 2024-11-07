import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:infinity_edge_app/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/cart_menu_icon.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:infinity_edge_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';
import 'package:infinity_edge_app/utils/device/device_utility.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: KAppbar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            KPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  KHomeAppBar(),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  //SearchBar
                  KSearchContainer(text: "Search In Store"),
                  const SizedBox(height: KSizes.spaceBtwSections),

                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: KSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                        KSectionHeading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: KColors.white,
                        ),
                        const SizedBox(height: KSizes.spaceBtwItems),
                        //Scrollable Categories
                        KHomeCategories()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



