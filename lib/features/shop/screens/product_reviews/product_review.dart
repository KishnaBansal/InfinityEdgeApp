import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/ratings/rating_indicator.dart';
import 'package:infinity_edge_app/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:infinity_edge_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:infinity_edge_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/device/device_utility.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: KAppbar(title: Text("Reviews & Ratings"), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you will be buying"),
              SizedBox(height: KSizes.spaceBtwItems),

              // Overall Product Ratings
              KOverallProductRating(),
              KRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: KSizes.spaceBtwSections),

              // User Reviews List
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

