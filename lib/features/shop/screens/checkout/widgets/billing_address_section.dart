import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KBillingAddressScreen extends StatelessWidget {
  const KBillingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KSectionHeading(
          title: "Shipping Address",
          buttontitle: "Change",
          onPressed: () {},
        ),
        Text("Someone", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: KSizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 18),
            SizedBox(width: KSizes.spaceBtwItems),
            Text("+91-123-456-7890",style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        SizedBox(height: KSizes.spaceBtwItems/2),
        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 18),
            SizedBox(width: KSizes.spaceBtwItems),
            Text("Somewhere on Earth",style: Theme.of(context).textTheme.bodyMedium,softWrap: true),
          ],
        ),
      ],
    );
  }
}
