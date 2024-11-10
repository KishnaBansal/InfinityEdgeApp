import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/helpers/helper_functions.dart';

class KCartCounterIcon extends StatelessWidget {
  const KCartCounterIcon({
    super.key,
    this.iconColor = KColors.white,
    required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag, color: dark ? KColors.white : KColors.black),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                "3",
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: KColors.white,
                      fontSizeFactor: 0.9,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
