import 'package:flutter/material.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/features/shop/orders/widgets/orders_list.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: KAppbar(
        title: Text(
          "My Orders",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(KSizes.defaultSpace),

        // Orders
        child: KOrderListItems(),
      ),
    );
  }
}
