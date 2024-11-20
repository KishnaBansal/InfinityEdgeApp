import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KBillingPaymentSection extends StatelessWidget {
  const KBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        KSectionHeading(
          title: "Payment Method",
          buttontitle: "Change",
          onPressed: () {},
        ),
        SizedBox(height: KSizes.spaceBtwItems / 2),
        Row(
          children: [
            KRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? KColors.light : KColors.white,
              padding: EdgeInsets.all(KSizes.sm),
              child: Image(
                image: AssetImage(KImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: KSizes.spaceBtwItems / 2),
            Text("PayPal",style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ],
    );
  }
}
