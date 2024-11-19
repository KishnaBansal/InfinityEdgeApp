import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/appbar/appbar.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppbar(
        showBackArrow: true,
        title: Text("Add New Address"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: "Name")),
                SizedBox(height: KSizes.spaceBtwInputFields),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: "Phone Number")),
                SizedBox(height: KSizes.spaceBtwInputFields),
                Row(children: [
                Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: "Street"))),
                SizedBox(width: KSizes.spaceBtwInputFields),
                Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: "Postal Code"))),
                ],),
                SizedBox(height: KSizes.spaceBtwInputFields),
                Row(children: [
                Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: "City"))),
                SizedBox(width: KSizes.spaceBtwInputFields),
                Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: "State"))),
                ],),
                SizedBox(height: KSizes.spaceBtwInputFields),
                TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: "Country")),
                SizedBox(height: KSizes.spaceBtwInputFields*2),
                SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {}, child: Text("Save"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
