import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:infinity_edge_app/common/widgets/images/circular_image.dart';
import 'package:infinity_edge_app/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:infinity_edge_app/common/widgets/list_tile/user_profile_tile.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/features/personalization/screens/address/address.dart';
import 'package:infinity_edge_app/features/personalization/screens/profile/profile.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Header
          KPrimaryHeaderContainer(
            child: Column(
              children: [
                KAppbar(
                  title: Text(
                    "Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: KColors.white),
                  ),
                ),

                //User Profile Card
                KUserProfileTile(onPressed: () => Get.to(() => ProfileScreen())),
                const SizedBox(height: KSizes.spaceBtwSections),
              ],
            ),
          ),

          //body
          Padding(
            padding: EdgeInsets.all(KSizes.defaultSpace),
            child: Column(
              children: [
                //Account Settings
                KSectionHeading(title: "Account Settings",showActionButton: false,),
                SizedBox(height: KSizes.spaceBtwItems),
                KSettingsMenuTile(title: "My Addresses", subtitle: "Set Shopping Delivery Address", icon: Iconsax.safe_home,onTap: () => Get.to(() => UserAddressScreen())),
                KSettingsMenuTile(title: "My Cart", subtitle: "Add, remove products and move to checkout", icon: Iconsax.shopping_cart,onTap: () {}),
                KSettingsMenuTile(title: "My Orders", subtitle: "In-Progress and completed orders", icon: Iconsax.bag_tick,onTap: () {}),
                KSettingsMenuTile(title: "Bank Account", subtitle: "Withdraw balance to registered bank account", icon: Iconsax.bank,onTap: () {}),
                KSettingsMenuTile(title: "My Coupons", subtitle: "List of all the discounted coupons", icon: Iconsax.discount_shape,onTap: () {}),
                KSettingsMenuTile(title: "Notifications", subtitle: "Set any kind of notification message", icon: Iconsax.notification,onTap: () {}),
                KSettingsMenuTile(title: "Account Privacy", subtitle: "Manage data usage and connected accounts", icon: Iconsax.security_card,onTap: () {}),

                //App Settings
                SizedBox(height: KSizes.spaceBtwSections),
                KSectionHeading(title: "App Settings",showActionButton: false,),
                SizedBox(height: KSizes.spaceBtwItems),
                KSettingsMenuTile(title: "Load Data", subtitle: "Upload data to your Cloud Firebase", icon: Iconsax.document_upload,onTap: () {}),
                KSettingsMenuTile(title: "Geo Location", subtitle: "Set reccomendation based on location", icon: Iconsax.location,trailing: Switch(value: true, onChanged: (value) {},),),
                KSettingsMenuTile(title: "Safe Mode", subtitle: "Search result is safe for all ages", icon: Iconsax.security_user,trailing: Switch(value: false, onChanged: (value) {},),),
                KSettingsMenuTile(title: "HD Image Quality", subtitle: "Set image quality to be seen", icon: Iconsax.image,trailing: Switch(value: false, onChanged: (value) {},),),

                //Logout Button
                SizedBox(height: KSizes.spaceBtwItems),
                SizedBox(width: double.infinity,child: OutlinedButton(onPressed: () {}, child: Text("Logout"),),),
                SizedBox(height: KSizes.spaceBtwSections * 2.5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
