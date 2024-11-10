import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:infinity_edge_app/common/widgets/images/circular_image.dart';
import 'package:infinity_edge_app/common/widgets/layout/grid_layout.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/cart_menu_icon.dart';
import 'package:infinity_edge_app/common/widgets/texts/brand_verified_text.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/enums.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: KAppbar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          KCartCounterIcon(onPressed: () {}),
        ],
      ),
      // //Nested scroll view
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              floating: true,
              backgroundColor: dark ? KColors.black : KColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(KSizes.defaultSpace),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    //Search Bar
                    SizedBox(height: KSizes.spaceBtwItems),
                    KSearchContainer(
                      text: "Search In Store",
                      showBackground: false,
                      showBorder: true,
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(height: KSizes.spaceBtwSections),

                    //Featured Brands
                    KSectionHeading(
                      title: "Featured Brands",
                      onPressed: () {},
                    ),
                    const SizedBox(height: KSizes.spaceBtwItems / 1.5),

                    KGridLayout(
                      mainAxisExtent: 80,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: KRoundedContainer(
                            padding: const EdgeInsets.all(KSizes.sm),
                            showBorder: true,
                            backgroundColor: Colors.transparent,
                            child: Row(
                              children: [
                                Flexible(
                                  child: KCircularImage(
                                    image: KImages.clothIcon,
                                    overlayColor:
                                        dark ? KColors.white : KColors.black,
                                    backgroundColor: Colors.transparent,
                                    isNetworkImage: false,
                                  ),
                                ),
                                const SizedBox(
                                    height: KSizes.spaceBtwItems / 2),

                                //Text
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      KBrandTitleWithVerifiedIcon(
                                        title: "Nike",
                                        brandTextSize: TextSizes.large,
                                      ),
                                      Text(
                                        "256 products",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
