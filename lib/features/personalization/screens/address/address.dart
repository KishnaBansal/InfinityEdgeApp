import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/features/personalization/screens/address/add_new_address.dart';
import 'package:infinity_edge_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        child: Icon(Iconsax.add, color: KColors.white),
        backgroundColor: KColors.primary,
      ),
      appBar: KAppbar(
        showBackArrow: true,
        title:
            Text("Addresses", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              KSingleAddress(selectedAddress: false),
              KSingleAddress(selectedAddress: true),
            ],
          ),
        ),
      ),
    );
  }
}
