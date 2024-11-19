import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/ratings/rating_indicator.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundImage: AssetImage(KImages.userProfileImage1)),
                SizedBox(width: KSizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(width: KSizes.spaceBtwItems),

        // Review
        Row(
          children: [
            KRatingBarIndicator(rating: 4),
            SizedBox(width: KSizes.spaceBtwItems),
            Text("01 Nov, 2024", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: KSizes.spaceBtwItems),
        ReadMoreText(
          "The user interface of the app is very intuitive and easy to use. I was able to navigate through different sections without any confusion. Making purchases was seamless, and the checkout process was quick and hassle-free. Overall, it provides a smooth and enjoyable shopping experience!. Great Job! ",
          trimLines: 2,
          trimExpandedText: "Show Less",
          trimCollapsedText: "Show More",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: KColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: KColors.primary),
          trimMode: TrimMode.Line,
        ),
        SizedBox(height: KSizes.spaceBtwItems),

        // Company review
        KRoundedContainer(
          backgroundColor: dark ? KColors.darkerGrey : KColors.grey,
          child: Padding(
            padding: EdgeInsets.all(KSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Infinity Edge Store",
                        style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2024",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: KSizes.spaceBtwItems),
                ReadMoreText(
                  "The user interface of the app is very intuitive and easy to use. I was able to navigate through different sections without any confusion. Making purchases was seamless, and the checkout process was quick and hassle-free. Overall, it provides a smooth and enjoyable shopping experience!. Great Job! ",
                  trimLines: 2,
                  trimExpandedText: "Show Less",
                  trimCollapsedText: "Show More",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: KColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: KColors.primary),
                  trimMode: TrimMode.Line,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: KSizes.spaceBtwSections),
      ],
    );
  }
}
