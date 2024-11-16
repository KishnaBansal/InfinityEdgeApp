import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:infinity_edge_app/common/widgets/images/circular_image.dart';
import 'package:infinity_edge_app/utils/constants/colors.dart';
import 'package:infinity_edge_app/utils/constants/image_strings.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: KCircularImage(
        image: KImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        "Infinity Edge",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: KColors.white),
      ),
      subtitle: Text(
        "support@infinityEdge.com",
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: KColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: KColors.white,
        ),
      ),
    );
  }
}
