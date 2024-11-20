import 'package:flutter/material.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class KBillingAmountSection extends StatelessWidget {
  const KBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        // Shipping Fee
        SizedBox(height: KSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium),
            Text('\$4',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        // Tax Fee
        SizedBox(height: KSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium),
            Text('\$3',style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        // Order Total
        SizedBox(height: KSizes.spaceBtwItems/2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium),
            Text('\$263',style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
