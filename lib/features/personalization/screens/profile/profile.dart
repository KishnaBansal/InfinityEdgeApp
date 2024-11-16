import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/common/widgets/images/circular_image.dart';
import 'package:infinity_edge_app/common/widgets/texts/section_heading.dart';
import 'package:infinity_edge_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        title: Text("Profile"),
        showBackArrow: true,
      ),
      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              //Profile Pictures
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    KCircularImage(
                      image: KImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {}, child: Text("Change Profile Picture"))
                  ],
                ),
              ),
          
              //Details
              SizedBox(height: KSizes.spaceBtwItems / 2),
              const Divider(),
              SizedBox(height: KSizes.spaceBtwItems),
              KSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              SizedBox(height: KSizes.spaceBtwItems),
              
              KProfileMenu(title: "Name",value: "Infinity Edge",onPressed: () {}),
              KProfileMenu(title: "Username",value: "Infinity Edge",onPressed: () {}),
          
              SizedBox(height: KSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: KSizes.spaceBtwItems),
          
              KProfileMenu(title: "User Id",value: "101",icon: Iconsax.copy,onPressed: () {}),
              KProfileMenu(title: "E-mail",value: "Infinity_Edge",onPressed: () {}),
              KProfileMenu(title: "Gender",value: "Male",onPressed: () {}),
              KProfileMenu(title: "Date of birth",value: "22 May, 2005",onPressed: () {}),
          
              Divider(),
              SizedBox(height: KSizes.spaceBtwItems),
          
              Center(child: TextButton(onPressed: () {}, child: Text("Delete Account",style: TextStyle(color: Colors.red),),)),
          
            ],
          ),
        ),
      ),
    );
  }
}


