import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:infinity_edge_app/common/widgets/products/carts/cart_menu_icon.dart';
import 'package:infinity_edge_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: KAppbar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            KPrimaryHeaderContainer(
              child: KHomeAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}




