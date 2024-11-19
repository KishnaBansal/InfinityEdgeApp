import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/sizes.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KSingleAddress extends StatelessWidget {
  const KSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return KRoundedContainer(
      padding: EdgeInsets.all(KSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? KColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? KColors.darkerGrey
              : KColors.grey,
      margin: EdgeInsets.only(bottom: KSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? KColors.light
                      : KColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: KSizes.sm/2),
              Text("(+91) 123 456 7890",maxLines: 1,overflow: TextOverflow.ellipsis),
              SizedBox(height: KSizes.sm/2),
              Text("Somewhere on earth in 2050 mnvdk vkjsndjvdsjln",softWrap: true),
              SizedBox(height: KSizes.sm/2),
            ],
            
          ),
        ],
      ),
    );
  }
}
