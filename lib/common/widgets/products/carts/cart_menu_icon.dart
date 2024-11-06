import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';

class KCartCounterIcon extends StatelessWidget {
  const KCartCounterIcon({
    super.key, required this.iconColor, required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.shopping_bag,color: iconColor),
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