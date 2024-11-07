import 'package:flutter/material.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KVerticalImageText extends StatelessWidget {
  const KVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = KColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: KSizes.spaceBtwItems),
        child: Column(
          children: [
            //circular icons
            Container(
              width: 54,
              height: 54,
              padding: const EdgeInsets.all(KSizes.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (dark ? KColors.black : KColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? KColors.white : KColors.black,
                ),
              ),
            ),
            //Text
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
