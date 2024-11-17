import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:infinity_edge_app/common/widgets/icons/icon_circular.dart';
import 'package:infinity_edge_app/common/widgets/images/rounded_image.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/features/shop/screens/wishlist/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:infinity_edge_app/features/shop/screens/wishlist/product_details/widgets/product_attributes.dart';
import 'package:infinity_edge_app/features/shop/screens/wishlist/product_details/widgets/product_detail_image_slider.dart';
import 'package:infinity_edge_app/features/shop/screens/wishlist/product_details/widgets/product_meta_data.dart';
import 'package:infinity_edge_app/features/shop/screens/wishlist/product_details/widgets/rating_share_widget.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: KBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /////  Product Image Slider
            KProductImageSlider(),

            /////   Product Details
            Padding(
              padding: EdgeInsets.only(
                right: KSizes.defaultSpace,
                left: KSizes.defaultSpace,
                bottom: KSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // Ratings and Share
                  KRatingAndShare(),

                  // Price, Title, Stock and Brand
                  KProductMetaData(),

                  // Attributes
                  ProductAttributes(),
                  SizedBox(height: KSizes.spaceBtwSections),

                  // Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Checkout"))),
                  SizedBox(height: KSizes.spaceBtwSections),

                  // Description
                  KSectionHeading(
                      title: "Description", showActionButton: false),
                  SizedBox(height: KSizes.spaceBtwItems),
                  ReadMoreText(
                    "Unmatched comfort meets timeless style with this premium T-shirt. Crafted from high-quality fabric, it offers exceptional durability and a soft feel for all-day wear. Perfect for casual outings or layering, it combines versatility with effortless fashion. Elevate your wardrobe and express yourself with confidence.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show More",
                    trimExpandedText: " Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  // reviews
                  Divider(),
                  SizedBox(height: KSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KSectionHeading(
                        title: "Reviews(199)",
                        showActionButton: false,
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Iconsax.arrow_right_3))
                    ],
                  ),

                  SizedBox(height: KSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
